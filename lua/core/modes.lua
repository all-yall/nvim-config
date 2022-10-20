local wk = owo.wk
local modes = {}
owo.modes = modes

local aug = vim.api.nvim_create_augroup("owo modes", {clear = true})

function modes.dbsys()
  wk.register({
    X = {"Send "},
  }, {
      mode   = "n",
      prefix = " ",
      buffer = 0,
    })
end

function modes.debug()
  wk.register ({
    [";"] = {owo.plug.dap.repl.toggle,  "debug toggle repl"},
    ["?"] = {owo.plug.dap.toggle_breakpoint,  "debug toggle breakpoint"},
    [","] = {owo.plug.dap.step_into,  "debug step into"},
    ["."] = {owo.plug.dap.step_over,  "debug step over"},
    [">"] = {owo.plug.dap.continue,    "debug continue"},
  }, {
      mode   = "n",
      prefix = "",
      buffer = 0,
    })
end

function modes.amazon()
  wk.register({
    t = {
      n = {owo.amazon.test_nearest, "test nearest"},
      w = {owo.amazon.test_suite, "test suite"},
      s = {owo.amazon.select_test_strategy, "select test strategy"},
    },
    b = {
      name = "build",
      c = {owo.amazon.run_checkstyle, "checkstyle"},
    },
  }, {prefix="<leader>"})
end

function modes.redirect_man_to_doc()
  wk.register({
    K = {"yiw:vert bel help \"<cr>", "Lookup symbol in vim help"}
  }, {mode="n", prefix="", buffer=0})
end

vim.api.nvim_create_autocmd("FileType", {
  group = aug,
  pattern={"lua","vim"},
  callback=modes.redirect_man_to_doc})


function modes.q_to_close()
  wk.register({
    q = {":q<cr>", "close window with q"}
  }, {mode="n", prefix="", buffer=0})
end

vim.api.nvim_create_autocmd("FileType", {
  group = aug,
  pattern={"help", "git", "fugitive"},
  callback=modes.q_to_close})
