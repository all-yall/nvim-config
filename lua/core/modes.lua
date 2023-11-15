local wk = owo.wk
local std = owo.std
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

function modes.text()
  vim.wo.wrap = true
  vim.bo.filetype = "markdown"
end

vim.api.nvim_create_autocmd("FileType", {
  group = aug,
  pattern={"chatgpt"},
  callback=modes.text})

local dap_setup = false
local function maybe_setup_dap()
  if not dap_setup then
    vim.cmd('JdtUpdateDebugConfig')
  end
  dap_setup = true
end

function modes.debug()
  wk.register ({
    [";"] = {owo.plug.dap.repl.toggle,  "debug toggle repl"},
    ["?"] = {owo.plug.dap.toggle_breakpoint,  "debug toggle breakpoint"},
    [","] = {owo.plug.dap.step_into,  "debug step into"},
    ["."] = {owo.plug.dap.step_over,  "debug step over"},
    [">"] = {function()
      maybe_setup_dap()
      owo.plug.dap.continue()
    end,    "debug continue"},
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

-- if at amazon, do as the amazonians
if owo.amazon then
  owo.modes.amazon()
end

local jdtls = require('jdtls')

function modes.jdtls()
  jdtls.setup_dap({
    config_overrides={},
  });

  local bindings = {
      j = {
      name = "jdtls bindings",
      o = {jdtls.organize_imports,  "organize imports"},
      i = {jdtls.compile,  "incremental build"},
      b = {jdtls.build_projects,  "build projects"},
      u = {jdtls.update_project_config,  "update project config"},
      c = {jdtls.extract_constant,  "constant extract"},
      v = {jdtls.extract_variable,  "variable extract"},
      V = {jdtls.extract_variable_all,  "all variables extract"},
      m = {jdtls.extract_method,  "method extract"},
      s = {jdtls.super_implementation,  "super goto"},
      p = {jdtls.javap,  "javap tool"},
      l = {jdtls.jshell,  "jshell tool"},
      j = {jdtls.jol,  "jol tool"},
      f = {jdtls.open_classfile,  "open classfile"},
      d = {
        name = "dap",
        c = {jdtls.test_class, "class test"},
        m = {jdtls.test_nearest_method, "method test"},
        p = {jdtls.pick_test, "pick test"},
        f = {jdtls.fetch_main_configs, "fetch main configs"},
        S = {jdtls.setup_dap_main_class_configs, "setup dap main class"},
        s = {jdtls.setup_dap, "setup dap"},
      },
    },
  }
  wk.register(bindings, {mode="n", prefix="<leader>"})
  wk.register(bindings, {mode="v", prefix="<leader>"})

  modes.debug()

  vim.bo.tabstop = 4
  vim.bo.shiftwidth = 4
end
--vscode-java-test.generate()
--vscode-java-test.goto_subjects()

function modes.redirect_man_to_doc()
  wk.register({
    K = {"yiw:vert bel help \"<cr>", "Lookup symbol in vim help"}
  }, {mode="n", prefix="", buffer=0})

  wk.register({
    K = {"y:vert bel help \"<cr>", "Lookup symbol in vim help"}
  }, {mode="v", prefix="", buffer=0})
end

vim.api.nvim_create_autocmd("FileType", {
  group = aug,
  pattern={"lua","vim","help"},
  callback=modes.redirect_man_to_doc})


function modes.q_to_close()
  wk.register({
    q = {":q!<cr>", "close window with q"}
  }, {mode="n", prefix="", buffer=0})
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

local repls = {}

local function create_repl(ft)
  local curr = vim.api.nvim_get_current_buf()
  local rep = owo.plug.iron.repl_here(ft)
  std.make_toggle_buffer(0)
  repls[ft] = rep.bufnr
  vim.api.nvim_set_current_buf(curr)
  vim.api.nvim_create_autocmd("BufUnload", {
    group = aug,
    buffer = rep.bufnr,
    callback = function()
      repls[ft] = nil
    end
  })
end

local function toggle_repl(ft)
  if not repls[ft] then
    create_repl(ft)
  end
  std.toggle_buf(repls[ft])
end

local function ensure_open(ft)
  if not repls[ft] then
    create_repl(ft)
  end
  std.ensure_open(repls[ft])
end

local function create_dev_mode(ft)
  wk.register({
  X = {
      function()
        std.motion_cmd(
          function(s)
            ensure_open(ft)
            owo.plug.iron.send(ft, s)
          end)
      end,
      ft .. " exec motion"},

  [""] = {
      function()
        ensure_open(ft)
        owo.plug.iron.send_file()
      end,
      ft .. " exec buffer"},

  [';'] = {function() toggle_repl(ft) end, ft.." toggle repl"}
  }, {
    modes = "n",
    prefix = "",
    buffer = 0,
  })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"scheme", "ruby", "python", "sql", "haskell"},
  group = aug,
  callback = function(m)
    create_dev_mode(m.match)
  end
})


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

local function create_notes_mode()
  wk.register({
    ["<Enter>"] = {
      function()
        vim.api.nvim_feedkeys("gf", 'n', false)
      end,
      "go to file",
    },
    ["<Backspace>"] = {
      owo.buf.alt,
      "back file",
    },
  }, {
    modes = "n",
    prefix = "",
    buffer = 0,
  })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"markdown"},
  group = aug,
  callback = function()
    create_notes_mode()
  end
})

