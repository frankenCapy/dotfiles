return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- Update registry contents on plugin update
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜", 
            package_uninstalled = "✗"
          }
        }
      })
      
      -- Auto-install language servers
      local mason_registry = require("mason-registry")
      local servers = { "ruff", "pyright", "vtsls" }
      
      -- Ensure Mason registry is updated
      mason_registry.refresh()
      
      for _, server in ipairs(servers) do
        if not mason_registry.is_installed(server) then
          local package = mason_registry.get_package(server)
          package:install()
        end
      end
    end,
  },
}
