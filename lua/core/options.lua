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
vim.g.loaded_python3_provider = 0 --only need for gpt plugin 
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0

vim.go.laststatus = 0

local o = {
  compatible = false,

  tabstop    = 2,
  shiftwidth = 2,
  expandtab  = true,
  autoindent = true,

  cursorline = true,
  incsearch  = true,
  hidden     = true,
  mouse      = 'a',
  number     = true,
  wrap       = false,
  undofile   = true,
  encoding = "UTF-8",
  termguicolors = true,
  -- see notify.lua for cmd height.
}

for opt, val in pairs(o) do
  vim.opt[opt] = val
end

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
