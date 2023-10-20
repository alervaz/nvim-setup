local lsp = require("lsp-zero")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local luasnip = require('luasnip')

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
  })
})
-- `/` cmdline setup.
cmp.setup.cmdline('/', {
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
require'lspconfig'.templ.setup{}

-- Fix Undefined global 'vim'
lsp.nvim_workspace()
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Enter>'] = cmp.mapping.confirm({ select = true }),
  ["<C-b>"] = cmp.mapping.complete(),
})


require('lspconfig').tsserver.setup({
  single_file_support = false,
  on_init = function(client)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})

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
--   filetypes = { "html", "templ", "go" },
--   root_dir = function() return vim.loop.cwd() end
-- }
require 'lspconfig'.html.setup {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html", "templ" },
  root_dir = function() return vim.loop.cwd() end
}

require 'lspconfig'.emmet_language_server.setup {
  cmd = { "emmet-language-server", "--stdio" },
  filetypes = { "html", "templ", "typescriptreact", "javascriptreact" },
  root_dir = function() return vim.loop.cwd() end
}

cmp.setup({
  sources = { { name = 'nvim_lsp' } },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})


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
-- local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
-- local lsp_format_on_save = function(bufnr)
--   vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
--   vim.api.nvim_create_autocmd('BufWritePre', {
--     group = augroup,
--     buffer = bufnr,
--     callback = function()
--       vim.lsp.buf.format()
--     end,
--   })
-- end

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['gopls'] = { 'go' },
    ['rust_analyzer'] = { 'rust' },
    ['tsserver'] = { "typescript", "javascript", "tsx", "jsx", "javascriptreact", "typescriptreact" },
    ['templ'] = { 'templ' }
    -- ['prettier'] = { "jsx" },
    -- ['clang-format'] = { "c++", "cpp", "c" }
  }
})



lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})

local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = ""
  }
  vim.lsp.buf.execute_command(params)
end

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
