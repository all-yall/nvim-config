local paq = require 'paq'
owo.paq = paq

-- parinfer
paq {
  -- Colors
  'archseer/colibri.vim';
  {"catppuccin/nvim", as="catppuccin"};

  -- Language Server and Syntax Highlighting
  'neovim/nvim-lspconfig';
  {'nvim-treesitter/nvim-treesitter', run = function() vim.cmd("TSUpdate") end};
  'nvim-treesitter/nvim-treesitter-context';
  'p00f/nvim-ts-rainbow';
  'lukas-reineke/indent-blankline.nvim';
  'williamboman/mason.nvim';
  'jose-elias-alvarez/null-ls.nvim';
  'mfussenegger/nvim-dap';
  'williamboman/mason-lspconfig.nvim';

  -- GUI
  'folke/which-key.nvim';
  'nvim-telescope/telescope.nvim';
  {'nvim-telescope/telescope-fzf-native.nvim',
    run = [[cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && 
            cmake --build build --config Release && 
            cmake --install build --prefix build]]};
  'stevearc/aerial.nvim'; -- NOTE: requires lsp
  'nvim-neo-tree/neo-tree.nvim';
  'akinsho/bufferline.nvim';
  'lewis6991/gitsigns.nvim';
  'bfredl/nvim-luadev';
  'max397574/better-escape.nvim';
  'goolord/alpha-nvim';
  'rcarriga/nvim-notify';
  'hkupty/iron.nvim';

  ---- New Commands
  '--tpope/vim-fugitive';
  'vim-test/vim-test';
  'junegunn/vim-easy-align';
  'L3MON4D3/LuaSnip';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-path';
  'hrsh7th/cmp-cmdline';
  'hrsh7th/nvim-cmp';
  'saadparwaiz1/cmp_luasnip';

  -- Meta Stuff
  'lewis6991/impatient.nvim';
  'nvim-lua/plenary.nvim'; -- req: a few things?
  'kyazdani42/nvim-web-devicons'; -- req: bufferline
  'MunifTanjim/nui.nvim'; -- req: telescope

  -- Language Specific
  'mfussenegger/nvim-jdtls';
  'elkowar/yuck.vim';

  'NvChad/nvim-colorizer.lua';
  -- TODO; understand/deal with
  --'famiu/bufdelete.nvim';
  --'mg979/vim-visual-multi';


  --  '/apollo/env/envImprovement/vim/amazon/brazil-config';
  --{'brazil-config',
    --url='/apollo/env/NinjaHooks/configuration/vim/amazon/brazil-config'};
  --{'amazon-gbrowse',
   -- url='ssh://git.amazon.com:2222/pkg/Vim-code-browse'};
  -- 'jasdel/vim-smithy'; -- lol smithy
}
