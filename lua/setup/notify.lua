local notify = require 'notify'
owo.plug.notify = notify

notify.setup {
  background_colour = "#000000",
  fps = 10,
  icons = {
    DEBUG = "",
    ERROR = "",
    INFO = "",
    TRACE = "✎",
    WARN = ""
  },
  level = 2,
  minimum_width = 50,
  render = "compact",
  stages = "static",
  timeout = 5000,
  top_down = true
}

vim.opt.cmdheight = 0
