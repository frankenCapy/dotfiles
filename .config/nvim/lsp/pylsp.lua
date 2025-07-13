-- Python Language Server Protocol Configuration
-- A minimal alternative to Pyright/Ruff for lighter environments

return {
  cmd = { "pylsp" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    ".git",
  },
  settings = {
    pylsp = {
      plugins = {
        -- Core functionality
        jedi_completion = { enabled = true },
        jedi_hover = { enabled = true },
        jedi_references = { enabled = true },
        jedi_signature_help = { enabled = true },
        jedi_symbols = { enabled = true },

        -- Linters - disable what you don't need
        pycodestyle = { enabled = false, maxLineLength = 120 },
        pyflakes = { enabled = false },
        mccabe = { enabled = false },

        -- Formatters
        autopep8 = { enabled = false }, -- Disable if using yapf
        yapf = { enabled = false },     -- Disable if using black
        black = { enabled = false },    -- Preferred formatter
      }
    }
  },
  on_attach = function(client, bufnr)
    -- Format on save (if desired)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("PylspFormat", { clear = false }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}
