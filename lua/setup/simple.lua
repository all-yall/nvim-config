require('mini.icons').setup()

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
    vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--ignore-file", "./.ignore"
        },
  },
}

require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

require("tabout").setup({
  tabkey = "<Tab>",
  backwards_tabkey = "<S-Tab>",
})

require('telescope').load_extension('fzf')

require('gitsigns').setup()

require("ibl").setup()


require("bigfile").setup{}

require('luasnip.loaders.from_vscode').lazy_load()

vim.g.indent_blankline_char_highlight_list = {'LineNr'}


