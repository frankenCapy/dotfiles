local M = {}

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
    "vtsls",
    "rust_analyzer",
    "pylsp",
    "cucumber_language_server"
  },
  automatic_installation = true,
}

local lspconfig = require("lspconfig")

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
}

local function mergeTables(t1, t2)
  for k, v in pairs(t2) do
    t1[k] = v
  end
  return t1
end

local map = function(keys, func, opts, mode)
  mode = mode or 'n'
  local default_opts = { noremap = true, silent = true }
  opts = opts and mergeTables(default_opts, opts) or default_opts
  vim.keymap.set(mode, keys, func, opts)
end
map('<Leader>ee', '<cmd>lua vim.diagnostic.open_float()<CR>')
map('<Leader>ek', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
map('<Leader>ej', '<cmd>lua vim.diagnostic.goto_next()<CR>')
map('<Leader>eq', '<cmd>lua vim.diagnostic.setloclist()<CR>')

require "lsp_signature".setup({
  toggle_key = '<M-m>'
})

local on_attach = function(_, bufnr)
  require "lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
      border = "rounded"
    }
  }, bufnr)

  map('gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { buffer = bufnr })
  map('gd', require('telescope.builtin').lsp_definitions, { buffer = bufnr })
  map('gr', require('telescope.builtin').lsp_references, { buffer = bufnr })
  map('K', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer = bufnr })
  map('gi', require('telescope.builtin').lsp_implementations, { buffer = bufnr })
  map('gk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { buffer = bufnr })
  map('<localleader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', { buffer = bufnr })
  map('<localleader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', { buffer = bufnr })
  map('<localleader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { buffer = bufnr })
  map('<localleader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { buffer = bufnr })
  map('<localleader>D', require('telescope.builtin').lsp_type_definitions, { buffer = bufnr })
  map('<localleader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', { buffer = bufnr })
  map('<localleader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { buffer = bufnr })
  map('<localleader>f', '<cmd>lua vim.lsp.buf.format({async=true})<CR>', { buffer = bufnr })
end

local capabilities = require('blink.cmp').get_lsp_capabilities()

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
  ["pylsp"] = function()
    lspconfig.pylsp.setup {
      capabilities = capabilities,
      handlers = handlers,
      on_attach = on_attach,
      settings = require('lsp.servers.pylsp').settings,
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
  ["rust_analyzer"] = function() end,
})

M.on_attach = on_attach

return M
