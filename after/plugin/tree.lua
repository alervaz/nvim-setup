require 'nvim-web-devicons'.setup {
  override_by_extension = {
    c = {
      icon = "",
      name = "c",
      color = "#005697"
    },

    css = {
      icon = "",
      name = "css",
      color = "#2862e9"
    },

    deb = {
      icon = "",
      name = "deb",
      color = "#d60048"
    },


    html = {
      icon = "",
      name = "html",
      color = "#e45527"
    },

    js = {
      icon = "󰌞",
      name = "js",
      color = "#f7e025"
    },

    kt = {
      icon = "󱈙",
      name = "kt",
      color = "#6a7be2"
    },

    out = {
      icon = "",
      name = "out",
    },


    ["robots.txt"] = {
      icon = "󰚩",
      name = "robots",
      color = "#bf3d35"
    },

    ts = {
      icon = "󰛦",
      name = "ts",
      color = "#377cc8"
    },

    ttf = {
      icon = "",
      name = "TrueTypeFont",
      color = "#c6c8c7"
    },

    rb = {
      icon = "",
      name = "rb",
      color = "#b21a0a"
    },

    vue = {
      icon = "󰡄",
      name = "vue",
      color = "#47ba87"
    },

    woff = {
      icon = "",
      name = "WebOpenFontFormat",
      color = "#c6c8c7"
    },

    woff2 = {
      icon = "",
      name = "WebOpenFontFormat2",
      color = "#c6c8c7"
    },

    xz = {
      icon = "",
      name = "xz",
      color = "#c6c8c7"
    },

    zip = {
      icon = "",
      name = "zip",
      color = "#fee79c"
    },
    astro = {
      icon = "", -- Here you can put any icon you want
      color = "#ff6209",
      name = "Astro"
    },

    mod = {
      icon = "󰟓",
      color = "#ff5b5b",
      name = "Gomod"
    },

    sum = {
      icon = "󰟓",
      color = "#ff5b5b",
      name = "Gosum"
    },

    go = {
      icon = "󰟓",
      color = "#0fbfce",
      name = "Go"
    },

    csproj = {
      icon = "󰗀",
      color = "#f67c08",
      name = "Csproj"
    },

    templ = {
      icon = "󰟓",
      color = "#ebb61b",
      name = "templ"
    },

    ['webpack.config.js'] = {
      icon = "󰜫",
      color = "#8ed5fa",
      name = "webpack"
    },

    ['tailwind.config.js'] = {
      icon = "󱏿",
      color = "#8ed5fa",
      name = "tailwind"
    },

    ['postcss.config.js'] = {
      icon = "󰔷",
      color = "#d6380a",
      name = "postcss"
    },

    ['vite.config.js'] = {
      icon = "🗲",
      color = "#f6c322",
      name = "vite",
    }
  }
}
vim.g.nvim_tree_ignore = { '.git' }
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    custom = { "^.git$" }
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
})


vim.opt.termguicolors = true

vim.keymap.set('n', '<leader>tt', function()
  vim.cmd(":NvimTreeToggle")
end)
vim.keymap.set('n', '<leader>tf', function()
  vim.cmd(":NvimTreeFocus")
end)

vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    symlink = "",
  },

}
