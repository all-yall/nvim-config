--
-- don't want extra stuff

vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

-- Lua reigns supreme!
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

vim.go.laststatus = 3

vim.opt.compatible = false

vim.opt.tabstop    = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab  = true
vim.opt.autoindent = true

vim.opt.cursorline = true
vim.opt.incsearch  = true
vim.opt.hidden     = true
vim.opt.mouse      = 'a'
vim.opt.number     = true
vim.opt.wrap       = false
vim.opt.undofile   = true
vim.opt.encoding = "UTF-8"
vim.opt.termguicolors = true

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
-- see notify.lua for cmd height.

vim.cmd [[
  syntax on
  filetype indent on
  filetype plugin on

  autocmd InsertEnter * set timeoutlen=300
  autocmd InsertLeave * set timeoutlen=1000
]]

local priv_exists, _ = pcall(require, 'core/private');
if (not priv_exists) then
  vim.notify("private.lua does not exist, nvim may not work.")
  vim.g.chat_gpt_key = ""
end
