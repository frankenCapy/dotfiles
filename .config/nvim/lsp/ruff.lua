-- Ruff Language Server Configuration
-- Modern Python linter and formatter with LSP support

return {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "ruff.toml",
    ".ruff.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    ".git",
  },
  init_options = {
    settings = {
      lineLength = 120,
      lint = {
        enable = true,
        select = { "E", "F", "I", "W" },
        preview = false,
      },
      format = {
        preview = false,
      },
      organizeImports = true,
      fixAll = true,
      logLevel = "info",
    },
  },
  on_attach = function(client, bufnr)
    -- Disable hover in favor of Pyright if both are running
    client.server_capabilities.hoverProvider = false

    -- Ruff-specific keymapping for import organization
    vim.keymap.set('n', '<localleader>ci', function()
      vim.lsp.buf.code_action({
        context = {
          only = { 'source.organizeImports' },
          diagnostics = vim.diagnostic.get(0),
        }
      })
    end, { buffer = bufnr, silent = true, desc = 'Organize imports' })

    -- Format on save
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("RuffFormat", { clear = false }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            bufnr = bufnr,
            filter = function(client)
              return client.name == "ruff"
            end
          })
        end,
      })
    end
  end,
}
