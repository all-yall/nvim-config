local luadev = require 'luadev'
owo.plug.luadev = luadev

local buf = nil

function luadev.show()
  if buf == nil then
    luadev.create_buf()
  end
  owo.std.ensure_open(buf)
end

function luadev.toggle()
  if buf then
    owo.std.toggle_buf(buf)
  else
    luadev.show()
  end
end

function luadev.exec_motion()
  owo.std.motion_cmd(function(s)
    luadev.exec(s)
    luadev.show()
  end)
end

function luadev.exec_buffer()
  luadev.exec(owo.std.get_buffer_text())
  luadev.show()
end

local aug = vim.api.nvim_create_augroup("luadev fixes", {})
vim.api.nvim_create_autocmd(
  {"BufFilePost"},
  {
    group = aug,
    pattern = "*\\[nvim-lua]",
    callback = function(file)
      buf = file.buf
      owo.std.make_toggle_buffer(buf)
      local o = vim.bo[buf]
      o.buflisted = false
      o.buftype = "nofile"
  end})
