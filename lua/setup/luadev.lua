local luadev = require 'luadev'
owo.plug.luadev = luadev

function luadev.show()
end

function luadev.exec_motion()
  luadev.show()
  owo.std.motion_cmd(luadev.exec)
end

function luadev.exec_buffer()
  luadev.show()
  luadev.exec(owo.std.get_text_in_range("0", "$", "line"))
end

vim.api.nvim_create_autocmd(
  {"BufCreate"},
  {pattern = '\\[nvim-lua\\]', callback = function(file)
    print("Test")
    local fopts = vim.api.nvim_buf_get_options(file.buf)
    fopts.modifiable = false
  end})
