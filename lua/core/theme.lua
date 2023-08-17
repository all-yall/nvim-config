
local aug = vim.api.nvim_create_augroup("owo colorscheme tweaks", {clear=true})
local register_tweaks = function(colorscheme, func)
  vim.api.nvim_create_autocmd({"ColorScheme"}, {
    group = aug,
    pattern = colorscheme, callback = func
  })
end

register_tweaks("colibri", function()
  vim.cmd [[
    set termguicolors
    hi normal guibg=clear 
    hi type ctermfg=white cterm=bold
    hi cursorcolumn ctermbg=238
    hi cursorline   ctermbg=238
    hi cursorline   cterm=none
    hi visual       guibg=#5421b3 
  ]]
end)

register_tweaks("embark", function()
  vim.cmd [[ 
    set termguicolors
    hi StatusLine guibg=#2d2b40
    hi StatusLineNc guibg=#2d2b40
  ]]
end)

vim.cmd.colorscheme("dracula")

