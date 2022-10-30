
require('nvim-web-devicons').setup {
  default= true,
}

require'colorizer'.setup{
  scss = {
    css=true,
    css_fn=true,
  }
}

require('telescope').setup{
  defaults = {
    layout_strategy = 'vertical',
    layout_config = { height = 0.80, width = 0.70 },
  },
}
require('telescope').load_extension('fzf')

require('gitsigns').setup()

require('aerial').setup {
  -- To see all available values, see :help SymbolKind
  filter_kind = false,--{}
}

local style = require("catppuccin.palettes").get_palette(vim.g.catppuccin_flavour)
require("bufferline").setup{
  options = {diagnostics = "nvim_lsp"},
	highlights = require("catppuccin.groups.integrations.bufferline").get {
		styles = { "italic", "bold" },
		custom = {
			style = {
				background = { fg = style.text },
			},
		},
	},
}

require("indent_blankline").setup {
  -- for example, context is off by default, use this to turn it on
  show_current_context = true,
  show_current_context_start = true,
}
vim.g.indent_blankline_char_highlight_list = {'LineNr'}

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.diagnostics.eslint,
        require("null-ls").builtins.completion.spell,
    },
})

owo.plug.dap = require 'dap'
