return {
  -- Colors
  {"catppuccin/nvim", name="catppuccin"},

  -- Language Server and Syntax Highlighting
  'neovim/nvim-lspconfig',
  {'nvim-treesitter/nvim-treesitter', build = function() vim.cmd("TSUpdate") end},
  'nvim-treesitter/nvim-treesitter-context',
  'lukas-reineke/indent-blankline.nvim',
  'williamboman/mason.nvim',
  'jose-elias-alvarez/null-ls.nvim',
  'mfussenegger/nvim-dap',
  'williamboman/mason-lspconfig.nvim',

  -- GUI
  'folke/which-key.nvim',
  'nvim-telescope/telescope.nvim',
  {'nvim-telescope/telescope-fzf-native.nvim',
   build = function() os.execute[[
             cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim/ &&
             cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release &&
             cmake --build build --config Release &&
             cmake --install build --prefix build
             ]] end
           },
  'akinsho/bufferline.nvim',
  'lewis6991/gitsigns.nvim',
  'goolord/alpha-nvim',
  'rcarriga/nvim-notify',
  'kyazdani42/nvim-web-devicons',
  'echasnovski/mini.icons',

  -- Functional
  'simrat39/symbols-outline.nvim',
  'gioele/vim-autoswap',
  'max397574/better-escape.nvim',
  'LunarVim/bigfile.nvim',
  'mikesmithgh/kitty-scrollback.nvim',

  -- New Commands
  'tpope/vim-fugitive',
  'vim-test/vim-test',
  'junegunn/vim-easy-align',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp-signature-help',

  -- Meta Stuff
  'lewis6991/impatient.nvim',
  'nvim-lua/plenary.nvim', -- req: a few things? 'kyazdani42/nvim-web-devicons'; -- req: bufferline
  'MunifTanjim/nui.nvim', -- req: telescope
  'kyazdani42/nvim-web-devicons',

  -- Language Specific
  'mfussenegger/nvim-jdtls',
  'NvChad/nvim-colorizer.lua',
}
