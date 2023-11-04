local colors = {
  bg     = "#181825",
  bg2    = '#181825',
  bg3    = '#1e1e2e',
  purple = '#c6a0f6',
  blue   = '#7dc4e4',
  green  = '#a5d994',
  yellow = '#eed49f',
  orange = '#ffb084',
  red    = '#ed8796',
  white  = '#FFF'
}
local theme = {
  normal = {
    a = { bg = colors.purple, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.bg3, fg = colors.white },
    c = { bg = colors.bg, fg = colors.white }
  },
  insert = {
    a = { bg = colors.blue, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.bg3, fg = colors.white },
    c = { bg = colors.bg3, fg = colors.white }
  },
  visual = {
    a = { bg = colors.yellow, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.bg3, fg = colors.white },
    c = { bg = colors.bg2, fg = colors.white }
  },
  replace = {
    a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.bg3, fg = colors.white },
    c = { bg = colors.bg, fg = colors.white }
  },
  command = {
    a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.bg3, fg = colors.white },
    c = { bg = colors.bg2, fg = colors.white }
  },
  inactive = {
    a = { bg = colors.white, fg = colors.red, gui = 'bold' },
    b = { bg = colors.bg, fg = colors.white },
    c = { bg = colors.bg, fg = colors.white }
  },
  terminal = {
    a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.bg, fg = colors.white },
    c = { bg = colors.bg, fg = colors.white }
  }
}
require('lualine').setup { options = { theme = theme } }
