local std = owo.std;

local toggle_view_percentage = 0.333

function std.split(opt)
  local curr_focus = vim.api.nvim_get_current_win()
  vim.cmd("bel split")
  if opt.cmd then
    vim.cmd(opt.cmd)
  end
  local ret = vim.api.nvim_get_current_win()
  vim.api.nvim_set_current_win(curr_focus)
  return ret
end

function std.toggle_buf(buf)
  local win = std.find_win_holding(buf)
  if win then
    local toggle_height = vim.api.nvim_win_get_height(win)
    vim.api.nvim_win_close(win, true)
    local total_height = vim.api.nvim_win_get_height(0)
    toggle_view_percentage = toggle_height / total_height
  else
    std.toggle_open(buf)
  end
end

function std.toggle_open(buf)
  local total_height = vim.api.nvim_win_get_height(0)
  local toggle_height = math.floor(total_height * toggle_view_percentage)
  vim.notify(""..toggle_height)
  local win = std.split({cmd="resize "..toggle_height})
  vim.api.nvim_win_set_buf(win, buf)
  return win
end

function std.find_win_holding(buf)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local curr_buf = vim.api.nvim_win_get_buf(win)
    if curr_buf == buf then
      return win
    end
  end
  return false
end

function std.ensure_open(buf)
  local win = std.find_win_holding(buf)
  if not win then
    return std.toggle_open(buf)
  end
end

function std.ensure_open_focus(buf)
  local win = std.ensure_open(buf)
  vim.api.nvim_set_current_win(win)
  return win
end

function std.make_toggle_buffer(buf)
  owo.wk.register({
    [";;"] = {"c", "un-toggle window"}
  },{
    buffer = buf
  })
end

