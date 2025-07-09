return {
	"folke/which-key.nvim",
	lazy = true,
	config = function()
		local wk = require("which-key")

		-- Setup which-key
		wk.setup()

		-- Diagnostic keymaps (German keyboard friendly - avoids AltGr+8/9 for [])
		wk.add({
			{ "<leader>d", group = "diagnostics", icon = "" },
			{ "<leader>dd", vim.diagnostic.open_float, desc = "Show diagnostic float" },
			{ "<leader>dn", function() vim.diagnostic.jump({ count = 1, float = true }) end, desc = "Next diagnostic" },
			{ "<leader>dp", function() vim.diagnostic.jump({ count = -1, float = true }) end, desc = "Previous diagnostic" },
			{ "<leader>dN", function() vim.diagnostic.jump({ count = math.huge, float = true }) end, desc = "Last diagnostic" },
			{ "<leader>dP", function() vim.diagnostic.jump({ count = -math.huge, float = true }) end, desc = "First diagnostic" },
			{ "<leader>dq", vim.diagnostic.setqflist, desc = "Add diagnostics to quickfix" },
			{ "<leader>dl", vim.diagnostic.setloclist, desc = "Add diagnostics to location list" },
			{ "<leader>da", function() vim.diagnostic.setqflist({ workspace = true }) end, desc = "Show all workspace diagnostics" },

			-- Severity-specific navigation
			{ "<leader>e", group = "errors", icon = "󰅚" },
			{ "<leader>en", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR, float = true }) end, desc = "Next error" },
			{ "<leader>ep", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR, float = true }) end, desc = "Previous error" },

			{ "<leader>w", group = "warnings", icon = "󰀪" },
			{ "<leader>wn", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.WARN, float = true }) end, desc = "Next warning" },
			{ "<leader>wp", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.WARN, float = true }) end, desc = "Previous warning" },
		})
	end
}
