
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
require('telescope').load_extension('fzf')

require('gitsigns').setup()

require("ibl").setup()

require('scat').setup{
  cr = {
    -- template_path = vim.fn.expandcmd"$HOME/<path_to_your_cr_template>",
    user = "iamally"
  }
}

vim.g.indent_blankline_char_highlight_list = {'LineNr'}
