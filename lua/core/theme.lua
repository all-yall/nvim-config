local register_tweaks = function(colorscheme, func)
  vim.api.nvim_create_autocmd({"ColorScheme"}, {
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

vim.cmd [[ 
let g:catppuccin_flavour = "mocha" 
]]
require("catppuccin").setup({
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	transparent_background = false,
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = {},
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	},
	color_overrides = {},
	custom_highlights = {},
})

--register_tweaks("iceberg", function()
--  vim.cmd [[ 
--    set termguicolors
--  ]]
--end)


vim.cmd [[ 
  colorscheme catppuccin
]]
