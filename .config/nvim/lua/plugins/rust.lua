-- return {
--   -- TODO: migrate to 'mrcjkb/rustaceanvim' or other,
--   'simrat39/rust-tools.nvim',
--   lazy = true,
--   dependencies = { 'nvim-dap', 'nvim-lspconfig' },
-- }

return {
  'mrcjkb/rustaceanvim',
  version = '^4', -- Recommended
  ft = { 'rust' },
  config = function()
    vim.g.rustaceanvim = {
      tools = {
      },
      server = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
        on_attach = function(client, bufnr)
          require('../lsp/init').on_attach(client, bufnr)
          -- you can also put keymaps in here
        end,
        settings = {
          -- rust-analyzer language server configuration - https://rust-analyzer.github.io/manual.html#configuration
          ['rust-analyzer'] = {
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true
            },
          },
        },
      },
      -- DAP configuration
      dap = {
      },
    }
  end
}
