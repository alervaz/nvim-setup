local lsp = require("lsp-zero")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local luasnip = require('luasnip')



local cmdIcons = {
  Variable = "CMD "
}

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' }
      }
    }
  }),
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = cmdIcons[vim_item.kind] or "FOO"
      return vim_item
    end
  }
})
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})


lsp.preset("recommended")




lsp.ensure_installed({
  'rust_analyzer',
})

vim.filetype.add({
  extension = {
    templ = "templ",
  },
})
require 'lspconfig'.templ.setup {}
require 'lspconfig'.eslint.setup {}

-- require 'lspconfig'.sqlls.setup {
--   cmd = { "sql-language-server", "up", "--method", "stdio" },
--   filetypes = { "sql", "mysql" },
--   root_dir = function() return vim.loop.cwd() end,
-- }

-- Fix Undefined global 'vim'
lsp.nvim_workspace()
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Enter>'] = cmp.mapping.confirm({ select = true }),
  ["<C-b>"] = cmp.mapping.complete(),
})


-- require('lspconfig').tsserver.setup({
--   single_file_support = false,
--   on_init = function(client)
--     client.server_capabilities.semanticTokensProvider = nil
--   end,
-- })
--
require("lspconfig").tsserver.setup {
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
}

-- require 'lspconfig'.unocss.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { 'html' },
--   root_dir = function()
--     return vim.fn.getcwd()
--   end
-- }

-- require 'lspconfig'.tailwindcss.setup {
--   cmd = { "tailwindcss-language-server", "--stdio" },
-- filetypes = { "html", "templ", "go", "heex", "django" },
--   root_dir = function() return vim.loop.cwd() end
-- }
--

require("lspconfig").tailwindcss.setup({
  filetypes = {
    'templ', "html", "templ", "go", "heex", "django"
    -- include any other filetypes where you need tailwindcss
  },
  init_options = {
    userLanguages = {
      templ = "html"
    }
  }
})

require 'lspconfig'.html.setup {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "templ", "heex" },
  root_dir = function() return vim.loop.cwd() end
}


require 'lspconfig'.emmet_language_server.setup {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = { "html", "templ", "typescriptreact", "javascriptreact", "typescript", "heex" },
  root_dir = function() return vim.loop.cwd() end
}



cmp.setup({
  sources = { { name = 'nvim_lsp' } },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = icons[vim_item.kind] or "FOO"
      return vim_item
    end
  }
})



cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- lsp.set_preferences({
--   suggest_lsp_servers = false,
--   sign_icons = {
--     error = 'E',
--     warn = 'W',
--     hint = 'H',
--     info = 'I'
--   }
-- })
--


lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }
  lsp.default_keymaps({ buffer = bufnr })
  require('luasnip.loaders.from_vscode').load()

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

  cmp.setup({
    sources = {
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
    },
  })
end)

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['rust_analyzer'] = { 'rust' },
    ['tsserver'] = { "typescript", "javascript", "tsx", "jsx", "javascriptreact", "typescriptreact" },
    ['templ'] = { 'templ' },
    ['lua_ls'] = { "lua" },
    ['html'] = { "html" },
    ['null-ls'] = { "python", "go", "javascript", "typescript" },
    ['elixirls'] = { "elixir" },
  }
})


lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.setup()

local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
  on_attach = function(client, bufnr)
    null_opts.on_attach(client, bufnr)
  end,
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.golines,
  }
})

vim.diagnostic.config({
  virtual_text = true
})


vim.opt.fillchars:append { eob = " " }
vim.cmd [[function! IndentWithI()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "i"
    endif
endfunction
nnoremap <expr> i IndentWithI()]]


vim.cmd [[function! IndentWithA()
    if len(getline('.')) == 0
        return "\"_cc"
    else
        return "a"
    endif
endfunction
nnoremap <expr> a IndentWithA()]]

-- vim.opt.colorcolumn = "80"
