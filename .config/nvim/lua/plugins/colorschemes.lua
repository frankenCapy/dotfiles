return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "mocha",
		transparent_background = false,
		dim_inactive = {
			enabled = true,
			shade = "dark",
			percentage = 0.15,
		},
		styles = {
			comments = { "italic" },
			conditionals = {},
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		color_overrides = {
			mocha = {
				-- Slightly brighter comments for readability
				overlay0 = "#7f849c",
			},
		},
		integrations = {
			cmp = true,
			gitsigns = true,
			treesitter = true,
			treesitter_context = true,
			telescope = { enabled = true },
			lsp_trouble = true,
			which_key = true,
			mason = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
			},
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd [[colorscheme catppuccin-mocha]]

		-- Dim diagnostic virtual text messages (more readable, visible on focus)
		vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextError', {
			fg = '#5e4444',  -- Dimmed red but readable
			italic = true,
		})
		vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextWarn', {
			fg = '#5e5438',  -- Dimmed yellow but readable
			italic = true,
		})
		vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextInfo', {
			fg = '#44485e',  -- Dimmed blue but readable
			italic = true,
		})
		vim.api.nvim_set_hl(0, 'DiagnosticVirtualTextHint', {
			fg = '#445e52',  -- Dimmed teal but readable
			italic = true,
		})

		-- Dim git signs to match line number aesthetic
		vim.api.nvim_set_hl(0, 'MiniDiffSignAdd', {
			fg = '#6a8a6a',  -- Brighter green but still subtle
		})
		vim.api.nvim_set_hl(0, 'MiniDiffSignChange', {
			fg = '#8a8160',  -- Brighter yellow/orange but still subtle
		})
		vim.api.nvim_set_hl(0, 'MiniDiffSignDelete', {
			fg = '#8a5a5a',  -- Brighter red but still subtle
		})
	end
}
