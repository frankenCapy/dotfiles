local M = {}

-- Setup installer & lsp configs
require("mason").setup()
local masonLspconfig = require("mason-lspconfig")
masonLspconfig.setup {
  ensure_installed = {
    "bashls",
    "cssls",
    "eslint",
    "gopls",
    "html",
    "jsonls",
    "yamlls",
    "lua_ls",
    "tailwindcss",
    "taplo",
    "tsserver",
    "jedi_language_server",
    "cucumber_language_server"
  },
  automatic_installation = true,
}

local lspconfig = require("lspconfig")

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>ee', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>ek', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>ej', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>eq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
require "lsp_signature".setup({
  toggle_key = '<M-m>'
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  require "lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    }
  }, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>wl',
    '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<localleader>f', '<cmd>lua vim.lsp.buf.format({async=true})<CR>', opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

masonLspconfig.setup_handlers({
  function(server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      handlers = handlers,
    }
  end,
  -- Next, you can provide targeted overrides for specific servers.
  ["eslint"] = function()
    lspconfig.eslint.setup {
      capabilities = capabilities,
      handlers = handlers,
      on_attach = function(client, bufnr)
        require('lsp.servers.eslint').on_attach(client, bufnr);
        on_attach(client, bufnr);
      end,
      settings = require('lsp.servers.eslint').settings,
    }
  end,
  ["jsonls"] = function()
    lspconfig.jsonls.setup {
      capabilities = capabilities,
      handlers = handlers,
      on_attach = on_attach,
      settings = require('lsp.servers.jsonls').settings,
    }
  end,
  ["yamlls"] = function()
    lspconfig.yamlls.setup {
      capabilities = capabilities,
      handlers = handlers,
      on_attach = on_attach,
      settings = require('lsp.servers.yamlls').settings,
    }
  end,
  ["lua_ls"] = function()
    lspconfig.lua_ls.setup {
      handlers = handlers,
      on_attach = on_attach,
      settings = require('lsp.servers.lua_ls').settings,
    }
  end,
  ["tsserver"] = function()
    lspconfig.tsserver.setup {
      capabilities = capabilities,
      handlers = handlers,
      init_options = require('lsp.servers.tsserver').init_options,
      on_attach = function(client, bufnr)
        require('lsp.servers.tsserver').on_attach(client, bufnr);
        on_attach(client, bufnr);
      end,
    }
  end,
  ["tailwindcss"] = function()
    lspconfig.tailwindcss.setup {
      capabilities = capabilities,
      filetypes = require('lsp.servers.tailwindcss').filetypes,
      handlers = handlers,
      init_options = require('lsp.servers.tailwindcss').init_options,
      on_attach = on_attach,
      settings = require('lsp.servers.tailwindcss').settings,
    }
  end,
})

M.on_attach = on_attach

return M
