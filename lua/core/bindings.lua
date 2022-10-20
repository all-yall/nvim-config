vim.g.mapleader = ' '

local wk = require('which-key')
wk.register({
  s = {"<cmd>w<cr>",           "save file"},
  d = {"<cmd>bd<cr>",          "close buf & win"},
  c = {"<C-w>c",               "close win"},
  q = {owo.buf.close,         "close buf"}, -- TODO; this binding isn't the best.
  l = {owo.buf.next,          "next buf"},
  h = {owo.buf.prev,          "prev buf"},
  w = {"<C-w>",                "window commands"},
  r = {"<cmd>noh<cr>",         "reset search highlight"},
  n = {vim.lsp.buf.rename,     "change name"},
  ["<Tab>"] = {owo.buf.alt,        "alt file"},

  ["."] = {"<cmd>cnext<cr>zz",  "quickfix next"},
  [","] = {"<cmd>cprev<cr>zz",  "quickfix prev"},
  ["/"] = {"<cmd>cclose<cr>", "quickfix close"},

  e = {
    name = "error",
    d = {vim.diagnostic.open_float, "describe error"},
    n = {vim.diagnostic.goto_next, "next error"},
    p = {vim.diagnostic.goto_prev, "prev error"},
    q = {vim.diagnostic.setloclist, "add to quickfix"},
  },

  g = {
    name = "git",
    ["<Enter>"] = {"<cmd>rightb vert G<cr>", "overview"},
    d = {"<cmd>rightb vert G diff<cr>", "diff"},
    b = {"<cmd>rightb vert G blame<cr>", "blame"},
    l = {"<cmd>rightb vert G log<cr>", "log"}, g = {"<cmd>rightb vert G log --graph  --date-order<cr>", "graph"},
    n = {"<cmd>Gitsigns next_hunk<cr>zz", "next hunk"},
    p = {"<cmd>Gitsigns prev_hunk<cr>zz", "prev hunk"},

    i = {"<cmd>Gclog<cr>", "interactive history"},

    [" "] = {":rightb vert G ", "open fugitive prompt"},
  },

  f =  {
    name = "find",
    g = {"<cmd>Telescope live_grep<cr>",  "grep project"},
    f = {"<cmd>Telescope find_files<cr>", "find file project"},
    b = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "search buffer"},
    s = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "search symbols in project"},
    t = {"<cmd>Telescope<cr>", "Telescope"},
  },

  t = {
    name = "toggle & tests",
    t = {"<cmd>NeoTreeRevealToggle<cr>",       "toggle file explorer"},
    r = {"<cmd>Gitsigns toggle_deleted<cr>",   "toggle removed"},
    o = {"<cmd>AerialToggle<cr>",  "toggle outline"},

  },

  x = {owo.plug.luadev.exec_motion, "lua exec motion"},
  X = {owo.plug.luadev.exec_buffer, "lua exec buffer"},

  [' '] = {
    name = "meta",
    l = {
      name = "lsp",
      i = {"<cmd>LspInfo<cr>", "info"},
      l = {"<cmd>LspLog<cr>", "log"},
      s = {"<cmd>LspStart<cr>", "start"},
      r = {"<cmd>LspRestart<cr>", "restart"},
      t = {"<cmd>LspStop<cr>", "stop"},
    },
    p = {
      name  = "packages",
      i     = {"<cmd>PaqInstall<cr>",  "install"},
      l     = {"<cmd>PaqLogOpen<cr>",  "log"},
      u     = {"<cmd>PaqUpdate<cr>",  "update"},
      c     = {"<cmd>PaqClean<cr>",  "clean"},
    },
    q = {"<cmd>xall<cr>", "save all and close"},
    f = {"<cmd>qa!<cr>", "close all without saving"},
  }
}, { prefix = "<leader>" })

wk.register({
  b = {":'<,'> GBrowse<cr>", "browse online"},
}, { mode = 'v', prefix = "<leader>" })

wk.register({
  K =  {"<cmd>vert bel Man<cr>", "vertically open man pages"},
  Q =  {owo.config.edit, "edit & save & source init file"},
  [""] =  {owo.config.stop_edit, "change working directory back"},
  H =  {vim.lsp.buf.hover, "hover"},

  gd = {"<cmd>Telescope lsp_definitions<cr>" , "definition"},
  gr = {"<cmd>Telescope lsp_references<cr>", "references"},
}, {mode = "n", prefix=""})


if owo.amazon then
  wk.register({
    t = {
      n = {owo.amazon.test_nearest, "test nearest"},
      w = {owo.amazon.test_suite, "test suite"},
      s = {owo.amazon.select_test_strategy, "select test strategy"},
    },
    b = {
      name = "build",
      c = {owo.amazon.run_checkstyle, "checkstyle"},
    }
  }, {prefix="<leader>"})
end


vim.cmd[[
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)


  " I make these typos all the time; time to fix them
  " who would want to  encrypt their file?
  command! X x 
  command! W w

  "exit insert mode with fd like spacemacs
  " I determined jf to be a very uncommon digraph
  imap jf <Esc>

  " temporary
  tmap jk k
]]
