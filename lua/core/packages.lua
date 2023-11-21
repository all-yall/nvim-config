local paq = require 'paq'
owo.paq = paq

-- parinfer
paq {
  -- Allow paq to manage itself
  'savq/paq-nvim';

  -- Colors
  {"catppuccin/nvim", as="catppuccin"};

  -- Language Server and Syntax Highlighting
  'neovim/nvim-lspconfig';
  {'nvim-treesitter/nvim-treesitter', build = function() vim.cmd("TSUpdate") end};
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
   build = function() os.execute[[
             cd ~/.local/share/nvim/site/pack/paqs/start/telescope-fzf-native.nvim/ &&
             cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release &&
             cmake --build build --config Release &&
             cmake --install build --prefix build
             ]] end
           };
  'simrat39/symbols-outline.nvim';
  'nvim-neo-tree/neo-tree.nvim';
  'akinsho/bufferline.nvim';
  'lewis6991/gitsigns.nvim';
  'max397574/better-escape.nvim';
  'goolord/alpha-nvim';
  'rcarriga/nvim-notify';
  'gioele/vim-autoswap';

  ---- New Commands
  'tpope/vim-fugitive';
  'vim-test/vim-test';
  'junegunn/vim-easy-align';
  'L3MON4D3/LuaSnip';
  'hrsh7th/cmp-nvim-lsp';
  'hrsh7th/cmp-buffer';
  'hrsh7th/cmp-path';
  'hrsh7th/cmp-cmdline';
  'hrsh7th/nvim-cmp';
  'saadparwaiz1/cmp_luasnip';
  --'CoderCookE/vim-chatgpt';

  -- Meta Stuff
  'lewis6991/impatient.nvim';
  'nvim-lua/plenary.nvim'; -- req: a few things? 'kyazdani42/nvim-web-devicons'; -- req: bufferline
  'MunifTanjim/nui.nvim'; -- req: telescope
  'kyazdani42/nvim-web-devicons';

  -- Language Specific
  'mfussenegger/nvim-jdtls';
  'NvChad/nvim-colorizer.lua';

  --  '/apollo/env/envImprovement/vim/amazon/brazil-config';
  --{'brazil-config',
    --url='/apollo/env/NinjaHooks/configuration/vim/amazon/brazil-config'};
  --{'amazon-gbrowse',
   -- url='ssh://git.amazon.com:2222/pkg/Vim-code-browse'};
  -- 'jasdel/vim-smithy'; -- lol smithy
}
