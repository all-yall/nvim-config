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

