vim.g.mapleader = ' '

local wk = require('which-key')
owo.wk = wk
wk.register({
  s = {"<cmd>w<cr>",           "save file"},
  d = {"<cmd>bd<cr>",          "close buf & win"},
  c = {"<C-w>c",               "close win"},
  C = {":Ask ",               "ask chatgpt"},
  q = {owo.buf.close,         "close buf"}, -- TODO; this binding isn't the best.
  Q = {owo.buf.force_close,   "force close buf"}, -- TODO; this binding isn't the best.
  l = {owo.buf.next,          "next buf"},
  h = {owo.buf.prev,          "prev buf"},
  w = {"<C-w>",                "window commands"},
  r = {"<cmd>noh<cr>",         "reset search highlight"},
  n = {vim.lsp.buf.rename,      "change name"},
  a = {vim.lsp.buf.code_action, "code action"},
  ["<Tab>"] = {owo.buf.alt,        "alt file"},

  [";"] = {"<cmd>cnext<cr>zz",  "quickfix next"},
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
    t = {"<cmd>Neotree toggle<cr>",       "toggle file explorer"},
    r = {"<cmd>Gitsigns toggle_deleted<cr>",   "toggle removed"},
    o = {"<cmd>AerialToggle<cr>",  "toggle outline"},
    c = {"<cmd>ColorizerToggle<cr>",  "toggle colorizer"},

  },


  [' '] = {
    name = "meta",
    l = {
      name = "lsp",
      g = {"<cmd>LspInstall<cr>", "get recommended"},
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
    c = {
      name = "cmp",
      b = {function() owo.cmp.setup.buffer{enabled=false} end, "disable cmp"}
    },
    q = {"<cmd>xall<cr>", "save all and close"},
    f = {"<cmd>qa!<cr>", "close all without saving"},
    n = {"<cmd>Telescope notify<cr>", "previous notifications"},
    d = {owo.plug.notify.dismiss({}), "dismiss notifications"},
    r = {owo.config.reload, "reload config"},
  }
}, { prefix = "<leader>" })

wk.register({
  a = {vim.lsp.buf.code_action, "code action"},
}, { mode = 'v', prefix = "<leader>" })


wk.register({
  K =  {"<cmd>vert bel Man<cr>", "vertically open man pages"},
  Q =  {owo.config.edit, "edit & save & source init file"},
  [""] =  {owo.config.stop_edit, "change working directory back"},
  H =  {vim.lsp.buf.hover, "hover"},

  gd = {"<cmd>Telescope lsp_definitions<cr>" , "definition"},
  gr = {"<cmd>Telescope lsp_references<cr>", "references"},
}, {mode = "n", prefix=""})


vim.cmd[[
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)


  " I make these typos all the time; time to fix them
  " who would want to  encrypt their file?
  command! X x 
  command! W w

  "exit insert mode with fd like spacemacs
  " I determined jk to be a very uncommon digraph
  imap jk <Esc>

  " Mimic Emacs Line Editing in Insert Mode Only
  imap <C-a> <Home>
  imap <C-b> <Left>
  imap <C-e> <End>
  imap <C-f> <Right>
  imap <M-b> <C-Left>
  imap <M-f> <C-Right>
  imap <C-k> <Esc>lDa
  imap <C-u> <Esc>d-1xi
  imap <C-y> <Esc>Pa
]]
