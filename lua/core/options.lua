-- Lua reigns supremem!
vim.g.loaded_python3_provider = 0
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

