vim.g.mapleader = ' '

local wk = require('which-key')
owo.wk = wk

wk.add({
  { "<leader> ", group = "meta" },
  { "<leader> c", group = "cmp" },
  { "<leader> cd", function() owo.cmp.setup.buffer{enabled=false} end, desc = "disable cmp" },
  { "<leader> ce", function() owo.cmp.setup.buffer{enabled=true} end, desc = "enable cmp" },
  { "<leader> f", "<cmd>qa!<cr>", desc = "close all without saving" },
  { "<leader> l", group = "lsp" },
  { "<leader> lg", "<cmd>LspInstall<cr>", desc = "get recommended" },
  { "<leader> li", "<cmd>LspInfo<cr>", desc = "info" },
  { "<leader> ll", "<cmd>LspLog<cr>", desc = "log" },
  { "<leader> lr", "<cmd>LspRestart<cr>", desc = "restart" },
  { "<leader> ls", "<cmd>LspStart<cr>", desc = "start" },
  { "<leader> lt", "<cmd>LspStop<cr>", desc = "stop" },
  { "<leader> n", "<cmd>Telescope notify<cr>", desc = "previous notifications" },
  { "<leader> p", "<cmd>Lazy<cr>", desc = "packages" },
  { "<leader> q", "<cmd>xall<cr>", desc = "save all and close" },
  { "<leader> r", owo.config.reload, desc = "reload config" },
  { "<leader>,", "<cmd>cprev<cr>zz", desc = "quickfix prev" },
  { "<leader>.", "<cmd>cnext<cr>zz", desc = "quickfix next" },
  { "<leader>/", "<cmd>cclose<cr>", desc = "quickfix close" },
  { "<leader>;", "<cmd>cnext<cr>zz", desc = "quickfix next" },
  { "<leader><Tab>", owo.buf.alt, desc = "alt file" },
  { "<leader>Q", owo.buf.force_close, desc = "force close buf" },
  { "<leader>a", vim.lsp.buf.code_action, desc = "code action" },
  { "<leader>c", "<C-w>c", desc = "close win" },
  { "<leader>d", "<cmd>bd<cr>", desc = "close buf & win" },
  { "<leader>e", group = "error" },
  { "<leader>ed", vim.diagnostic.open_float, desc = "describe error" },
  { "<leader>en", vim.diagnostic.goto_next, desc = "next error" },
  { "<leader>ep", vim.diagnostic.goto_prev, desc = "prev error" },
  { "<leader>eq", vim.diagnostic.setloclist, desc = "add to quickfix" },
  { "<leader>f", group = "find" },
  { "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "search buffer" },
  { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "find file project" },
  { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "grep project" },
  { "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "search symbols in project" },
  { "<leader>ft", "<cmd>Telescope<cr>", desc = "Telescope" },
  { "<leader>g", group = "git" },
  { "<leader>g ", ":rightb vert G ", desc = "open fugitive prompt" },
  { "<leader>g<Enter>", "<cmd>rightb vert G<cr>", desc = "overview" },
  { "<leader>gb", "<cmd>rightb vert G blame<cr>", desc = "blame" },
  { "<leader>gd", "<cmd>rightb vert G diff<cr>", desc = "diff" },
  { "<leader>gg", "<cmd>rightb vert G log --graph --date-order<cr>", desc = "graph" },
  { "<leader>gi", "<cmd>Gclog<cr>", desc = "interactive history" },
  { "<leader>gl", "<cmd>rightb vert G log<cr>", desc = "log" },
  { "<leader>gn", "<cmd>Gitsigns next_hunk<cr>zz", desc = "next hunk" },
  { "<leader>gp", "<cmd>Gitsigns prev_hunk<cr>zz", desc = "prev hunk" },
  { "<leader>h", owo.buf.prev, desc = "prev buf" },
  { "<leader>l", owo.buf.next, desc = "next buf" },
  { "<leader>n", vim.lsp.buf.rename, desc = "change name" },
  { "<leader>q", owo.buf.close, desc = "close buf" },
  { "<leader>r", "<cmd>noh<cr>", desc = "reset search highlight" },
  { "<leader>s", "<cmd>w<cr>", desc = "save file" },
  { "<leader>t", group = "toggle & tests" },
  { "<leader>tc", "<cmd>ColorizerToggle<cr>", desc = "toggle colorizer" },
  { "<leader>to", "<cmd>SymbolsOutline<cr>", desc = "toggle outline" },
  { "<leader>tr", "<cmd>Gitsigns toggle_deleted<cr>", desc = "toggle removed" },
  { "<leader>tt", "<cmd>Neotree toggle<cr>", desc = "toggle file explorer" },
  { "<leader>w", "<C-w>", desc = "window commands" }
})

wk.add({
  { "<leader>a", vim.lsp.buf.code_action, desc = "code action", mode = "v" },
})

wk.add({
  { "\17", owo.config.stop_edit, desc = "change working directory back" },
  { "H", vim.lsp.buf.hover, desc = "hover" },
  { "K", "<cmd>vert bel Man<cr>", desc = "vertically open man pages" },
  { "Q", owo.config.edit, desc = "edit & save & source init file" },
  { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "definition" },
  { "gr", "<cmd>Telescope lsp_references<cr>", desc = "references" },
  {"", "\"+", desc = "system clipboard"}
})

vim.cmd[[
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

  " I make these typos all the time; time to fix them
  " who would want to  encrypt their file?
  command! X x 
  command! W w

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
