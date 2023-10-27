vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

return require('lazy').setup({
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    -- or                              , branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    'Mofiqul/dracula.nvim',
  },
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
    end
  },
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
  },
  -- Hop (Better Navigation)
  {
    "phaazon/hop.nvim",
    lazy = true,
  },


  -- Lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
  },
  -- Which-key
  {
    'folke/which-key.nvim',
    lazy = true,
  },
  { 'akinsho/toggleterm.nvim',         version = "*",   config = true },
  { 'nvim-treesitter/nvim-treesitter', cmd = "TSUpdate" },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        functions = { italic = false },
        comments = { italic = false },
        keywords = { italic = false },
        variables = { italic = false },
      },
    },
  },
  {

    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup({})
    end
  },
  'windwp/nvim-ts-autotag',
  "mbbill/undotree",
  "theprimeagen/vim-be-good",
  "tpope/vim-fugitive",
  {
    'christoomey/vim-tmux-navigator', lazy = false
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require('catppuccin').setup({
        no_italic = true,
        flavour = "mocha",
      })
    end
  },
  "terrortylor/nvim-comment",
  {
    "olexsmir/gopher.nvim",
    dependencies = { -- dependencies
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd [[silent! GoInstallDeps]]
    end
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function()
      require('rose-pine').setup({ disable_italics = true })
      vim.cmd('colorscheme rose-pine')
    end
  },
  "theprimeagen/harpoon",
  'nvim-treesitter/playground',
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-ui",
  "kristijanhusak/vim-dadbod-completion",
  'hrsh7th/cmp-cmdline',
  'navarasu/onedark.nvim',
  {
    "nobbmaestro/nvim-andromeda",
    dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" }
  },
  'Rigellute/shades-of-purple.vim',
  'RaafatTurki/hex.nvim',
  "vrischmann/tree-sitter-templ",
  "ThePrimeagen/lsp-debug-tools.nvim",
  {
    "CodeGradox/onehalf-lush",
    lazy = false,
    priority = 1000,
    config = function()
      vim.api.nvim_set_option("background", "light")
      vim.cmd("colorscheme onehalf-lush")
    end
  },
  {
    "itchyny/lightline.vim",
    config = function()
      vim.g.lightline = {
        colorscheme = 'wombat',
      }
    end
  }
})
