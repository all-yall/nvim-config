local std = {}
owo.modes = {}
owo.std = std

function std.get_env(name)
  return vim.fn.expand("$" .. name)
end

function std.pwd()
  return vim.api.nvim_exec("pwd", true)
end

function std.notify(message)
  if type(message) ~= 'string' then
    message = vim.inspect(message)
  end
  if owo.plug and owo.plug.notify then
    owo.plug.notify.notify(message)
  else
    vim.api.nvim_out_write(message .. "\n")
  end
end

function owo.std.get_buffer_text()
  return vim.fn.join(vim.api.nvim_buf_get_lines(0, 0, -1, false),"\n")
end


--@param mark1 Name of mark starting the region
--@param mark2 Name of mark ending the region
--@param options Table containing the adjustment function, register type and selection mode
--@return region region between the two marks, as returned by |vim.region|
--@return start (row,col) tuple denoting the start of the region
--@return finish (row,col) tuple denoting the end of the region
function owo.std.get_marked_region(mark1, mark2, options)
  local bufnr = 0
  local adjust = options.adjust or function(pos1, pos2)
    return pos1, pos2
  end
  local regtype = options.regtype or vim.fn.visualmode()
  local selection = options.selection or (vim.o.selection ~= 'exclusive')

  local pos1 = vim.fn.getpos(mark1)
  local pos2 = vim.fn.getpos(mark2)
  pos1, pos2 = adjust(pos1, pos2)

  local start = { pos1[2] - 1, pos1[3] - 1 + pos1[4] }
  local finish = { pos2[2] - 1, pos2[3] - 1 + pos2[4] }

  -- Return if start or finish are invalid
  if start[2] < 0 or finish[1] < start[1] then return end

  local region = vim.region(bufnr, start, finish, regtype, selection)
  return region, start, finish
end

function owo.std.get_text_in_range(start_mark, end_mark, sel_type)
  local _, start, finish = std.get_marked_region(start_mark, end_mark, {})
  local lines = vim.api.nvim_buf_get_lines(0, start[1], finish[1]+1, false)
  if sel_type == "char" then
    lines[#lines] = string.sub(lines[#lines], 0, finish[2])
    lines[1] = string.sub(lines[1], start[2], -1)
  end
  local ret = vim.fn.join(lines, "\n")
  return ret
end

function std.get_selected(sel_type)
  return std.get_text_in_range("'[", "']", sel_type)
end

function std.motion_cmd(func, no_pass_text)
  std._motion_cmd_func = function(sel_type)
    if no_pass_text then
      func(sel_type)
    else
      local text = std.get_selected(sel_type)
      func(text)
    end
  end
  vim.go.operatorfunc = "v:lua.owo.std._motion_cmd_func"
  vim.api.nvim_feedkeys("g@", 'n', false) -- TODO bad way to do this
end

