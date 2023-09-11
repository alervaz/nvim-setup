local filetypes = {
  'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript',
  'xml',
  'php',
  'markdown',
  'astro', 'glimmer', 'handlebars', 'hbs'
}

require 'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
    enable_rename = true,
    filetypes = filetypes,
  }
}


