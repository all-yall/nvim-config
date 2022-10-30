vim.g.catppuccin_flavour ="macchiato"

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
		neotree = true,
		telescope = true,
		treesitter = true,
    treesitter_context = true,
    aerial = true,
    mason = true,
    ts_rainbow = true,
    which_key = true,
    dap = {enabled = true, enable_ui = true},
    native_lsp = {
      enabled = true,
    },
    gitsigns = true,
  },

		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
	color_overrides = {},
	custom_highlights = {},
})

