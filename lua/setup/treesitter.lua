-- for TreeSitter;  run :TSInstall <lang>
-- supported langs; https://github.com/nvim-treesitter/nvim-treesitter#supported-languages

local treesitter_langs = {"vim", "lua", "java", "rust"}

require('nvim-treesitter.configs').setup {
  ensure_installed = treesitter_langs,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  rainbow = {
    enable = true,
    -- disable = {},
    extended_mode = true,
    max_file_lines = nil,
    -- trans >w< 
    -- colors = {"#FFFFFF", "#5BCEFA", "#F5A9B8" },
    -- pride colors
    -- colors = { "#D12229", "#F68A1E", "#FDE01A", "#00904c", "#415eaf", "#9b4cab", }
    -- termcolors = {},
  },
}

