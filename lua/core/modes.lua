local wk = owo.wk
local std = owo.std
local modes = {}
owo.modes = modes

local aug = vim.api.nvim_create_augroup("owo modes", {clear = true})

local dap_setup = false
local function maybe_setup_dap()
  if not dap_setup then
    vim.cmd('JdtUpdateDebugConfig')
  end
  dap_setup = true
end

function modes.debug()
  wk.add({
    { "<leader>,", owo.plug.dap.step_into, buffer = 0, desc = "debug step into" },
    { "<leader>.", owo.plug.dap.step_over, buffer = 0, desc = "debug step over" },
    { "<leader>;", owo.plug.dap.repl.toggle, buffer = 0, desc = "debug toggle repl" },
    { "<leader>>", function()
      maybe_setup_dap()
      owo.plug.dap.continue()
    end, buffer = 0, desc = "debug continue" },
    { "<leader>?", owo.plug.dap.toggle_breakpoint, buffer = 0, desc = "debug toggle breakpoint" },
  })
end

function modes.amazon()
  wk.add({
    { "<leader>b", group = "build" },
    { "<leader>bc", owo.amazon.run_checkstyle, desc = "checkstyle" },
    { "<leader>tn", owo.amazon.test_nearest, desc = "test nearest" },
    { "<leader>ts", owo.amazon.select_test_strategy, desc = "select test strategy" },
    { "<leader>tw", owo.amazon.test_suite, desc = "test suite" },
  })
end

local jdtls = require('jdtls')

function modes.jdtls()
  jdtls.setup_dap({
    config_overrides={},
  });

  wk.add({
    { "<leader>j", group = "jdtls bindings" },
    { "<leader>jV", jdtls.extract_variable_all, desc = "all variables extract" },
    { "<leader>jb", jdtls.build_projects, desc = "build projects" },
    { "<leader>jc", jdtls.extract_constant, desc = "constant extract" },
    { "<leader>jd", group = "dap" },
    { "<leader>jdc", jdtls.test_class, desc = "class test" },
    { "<leader>jdm", jdtls.test_nearest_method, desc = "method test" },
    { "<leader>jdp", jdtls.pick_test, desc = "pick test" },
    { "<leader>jds", jdtls.setup_dap, desc = "setup dap" },
    { "<leader>jf", jdtls.open_classfile, desc = "open classfile" },
    { "<leader>ji", jdtls.compile, desc = "incremental build" },
    { "<leader>jj", jdtls.jol, desc = "jol tool" },
    { "<leader>jl", jdtls.jshell, desc = "jshell tool" },
    { "<leader>jm", jdtls.extract_method, desc = "method extract" },
    { "<leader>jo", jdtls.organize_imports, desc = "organize imports" },
    { "<leader>jp", jdtls.javap, desc = "javap tool" },
    { "<leader>js", jdtls.super_implementation, desc = "super goto" },
    { "<leader>ju", jdtls.update_project_config, desc = "update project config" },
    { "<leader>jv", jdtls.extract_variable, desc = "variable extract" },
  })

  modes.debug()

  vim.bo.tabstop = 4
  vim.bo.shiftwidth = 4
end

function modes.redirect_man_to_doc()
  wk.add({
    { "K", "yiw:vert bel help \"<cr>", desc = "Lookup symbol in vim help" },
    { "K", "y:vert bel help \"<cr>", mode = "v", desc = "Lookup symbol in vim help" },
  })
end

vim.api.nvim_create_autocmd("FileType", {
  group = aug,
  pattern={"lua","vim","help"},
  callback=modes.redirect_man_to_doc})


function modes.q_to_close()
  wk.add({
    { "q", ":q!<cr>", desc = "close window with q" },
  })
end

vim.api.nvim_create_autocmd("FileType", {
  group = aug,
  pattern={
    "help",
    "git",
    "fugitive",
    "fugitiveblame",
    "TelescopePrompt",
    "vim",
    "chatgpt",
    "termial",
  },
  callback=modes.q_to_close})

-- Treesitter indent isn't perfect, lol
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"go"},
  group = aug,
  callback = function(_)
    std.notify("Disabling treesitter indentexpr")
    vim.defer_fn(function()
      vim.bo.indentexpr=nil
      vim.bo.smartindent=true
    end, 30)
  end
})
