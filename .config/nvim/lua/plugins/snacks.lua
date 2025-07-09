return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		explorer = { enabled = true },
		picker = {
			sources = {
				explorer = {
					jump = { close = true },
					hidden = true
				}
			}
		},
		indent = {
			indent = { enabled = false },
			animate = { enabled = false },
			scope = {
				enabled = true,
				priority = 200,
				char = "│",
				only_current = true,
				hl = "SnacksIndent",
			},
		},
		input = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		statuscolumn = { enabled = true },
		words = { enabled = true },
	},
}
