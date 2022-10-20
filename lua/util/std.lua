local std = {}
owo.std = std

function std.get_env(name)
  return vim.fn.expand("$" .. name)
end

function std.pwd()
  return vim.api.nvim_exec("pwd", true)
end

function std.notify(message)
  vim.api.nvim_out_write(message .. "\n")
end

function std.get_text_in_range(start_mark, end_mark, sel_type)
  local s = vim.fn.getpos(start_mark)
  local e = vim.fn.getpos(end_mark)
  local sline = s[2] - 1
  local scol = s[3]
  local eline = e[2]
  local ecol = e[3]

  local lines = vim.api.nvim_buf_get_lines(0, sline, eline, false)

  if sel_type == "char" then
    lines[#lines] = string.sub(lines[#lines], 0, ecol)
    lines[1] = string.sub(lines[1], scol, -1)
  end
  local ret = vim.fn.join(lines, "\n")
  return ret
end

function std.get_selected(sel_type)
  return std.get_text_in_range("'[", "']", sel_type)
end

function std.motion_cmd(func)
  std._motion_cmd_func = function(sel_type)
    local text = std.get_selected(sel_type)
    func(text)
  end
  vim.go.operatorfunc = "v:lua.owo.std._motion_cmd_func"
  vim.api.nvim_feedkeys("g@", 'n', false) -- TODO bad way to do this
end
