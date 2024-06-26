return {
  "nvim-neorg/neorg",
  dependencies = { "luarocks.nvim", "folke/zen-mode.nvim" },
  version = "*",
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.ui.calendar"] = {},
        ["core.export"] = {
          config = {
            export_dir = "~/notes/<language>-export",
          }
        },
        ["core.presenter"] = {
          config = {
            zen_mode = "zen-mode",
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    }

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
