local M = {}

M.settings = {
  Lua = {
    runtime = {
      version = 'LuaJIT',
      -- diagnostics = {
      --   globals = { "vim" }
      -- },
    },
    workspace = {
      checkThirdParty = false,
      library = {
        vim.env.VIMRUNTIME,
        "${3rd}/luv/library"
      }
    },
    -- Do not send telemetry data containing a randomized but unique identifier
    telemetry = {
      enable = false,
    },
    format = {
      enable = true,
      defaultConfig = {
        indent_style = "space",
        indent_size = "2",
      }
    },
  }
}

return M
