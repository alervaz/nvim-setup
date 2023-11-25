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
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   config = function()
  --   end
  -- },
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
  },
  -- Hop (Better Navigation)
  -- {
  --   "phaazon/hop.nvim",
  --   lazy = true,
  -- },


  -- { 'akinsho/toggleterm.nvim',         version = "*",   config = true },
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
  'saadparwaiz1/cmp_luasnip',
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
      -- vim.cmd('colorscheme rose-pine')
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
      vim.cmd([[
        highlight Comment gui=NONE
        highlight String gui=NONE
        highlight Function gui=NONE
      ]])
      vim.api.nvim_command('highlight Comment cterm=NONE')
      vim.api.nvim_command('highlight String gui=NONE')
      vim.api.nvim_command('highlight Function gui=NONE')
    end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  "lunarvim/horizon.nvim",
  -- {
  --   "tamton-aquib/staline.nvim",
  --   dependencies = "nvim-tree/nvim-web-devicons",
  --   event = { "User", "BufNewFile", "BufReadPost", },
  --
  --   keys = {
  --     { "<leader>bn", "<cmd>ene<CR>", desc = "New buffer", },
  --     { "<leader>bl", "<cmd>bn<CR>",  desc = "Next buffer", },
  --     { "<leader>bh", "<cmd>bp<CR>",  desc = "Previous buffer", },
  --     { "<leader>bd", "<cmd>bd<CR>",  desc = "Delete buffer", },
  --   },
  -- },
  {
    "goolord/alpha-nvim",
    event = "VimEnter",

    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
                ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
                ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
                ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
                ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
                ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
                ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
            ]]

      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", "<cmd>Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", "<cmd>ene <BAR> startinsert <CR>"),
        -- dashboard.button("r", " " .. " Suggested files", "<cmd>Telescope frecency <CR>"),
        dashboard.button("g", " " .. " Find text", "<cmd>Telescope live_grep <CR>"),
      }
      return dashboard
    end,

    config = function(_, dashboard)
      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
          dashboard.section.footer.val = stats.count .. " plugins loaded in " .. ms .. "ms"
          require("alpha").redraw()
        end,
      })
    end,
  },
  {
    "echasnovski/mini.indentscope",
    event = { "BufReadPost", "BufNewFile", },
    opts = {
      symbol = "│",
      options = { try_as_border = true },
      show_current_context = true,
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "help", "alpha", "dashboard", "Trouble", "lazy", "mason" },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  "jose-elias-alvarez/null-ls.nvim",
  {
    'projekt0n/github-nvim-theme',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        options = {
          styles = {
            comments = '',
            keywords = 'bold',
            types = 'bold',
          }
        }
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    opts = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          operators = false,
          folds = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,    -- invert background for search, diffs, statuslines and errors
        contrast = "hard", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- lazy.nvim
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  }
})
