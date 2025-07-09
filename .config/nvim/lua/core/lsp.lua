-- LSP Configuration using native Neovim APIs

-- Configure global LSP capabilities with blink.cmp
local blink_ok, blink = pcall(require, 'blink.cmp')
if blink_ok then
	-- Set blink.cmp capabilities for all LSP servers
	vim.lsp.config('*', {
		capabilities = blink.get_lsp_capabilities(),
	})
end

-- Auto-discover LSP servers from lsp/ directory
local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
local servers = {}

-- Check if lsp directory exists
if vim.fn.isdirectory(lsp_dir) == 1 then
	-- Get all .lua files in lsp directory
	local lsp_files = vim.fn.glob(lsp_dir .. "/*.lua", false, true)

	for _, file in ipairs(lsp_files) do
		-- Extract filename without extension as server name
		local server_name = vim.fn.fnamemodify(file, ":t:r")
		table.insert(servers, server_name)
	end
end

-- Enable discovered language servers
-- Neovim will automatically load configs from ~/.config/nvim/lsp/
if #servers > 0 then
	vim.lsp.enable(servers)
	print("Enabled LSP servers: " .. table.concat(servers, ", "))
else
	print("No LSP servers found in lsp/ directory")
end

-- Diagnostic configuration
vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "●",
	},
	severity_sort = true,
	underline = true,
	update_in_insert = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✘",
			[vim.diagnostic.severity.WARN] = "▲",
			[vim.diagnostic.severity.HINT] = "⚑",
			[vim.diagnostic.severity.INFO] = "»",
		},
	},
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
	jump = {
		float = true,
	},
})

-- Handle diagnostic updates properly
vim.api.nvim_create_autocmd('DiagnosticChanged', {
	group = vim.api.nvim_create_augroup('DiagnosticDisplay', { clear = true }),
	callback = function(args)
		-- Ensure virtual text is updated after diagnostic changes
		vim.schedule(function()
			vim.diagnostic.show(nil, args.buf)
			vim.cmd('redrawstatus!')
		end)
	end,
})

-- Set up LspAttach autocommand for buffer-local configurations
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local bufnr = args.buf

		-- Blink.cmp completion is handled automatically via capabilities set globally above
		-- No manual completion enabling needed when blink.cmp capabilities are configured

		-- Buffer-local LSP keymaps
		local function map(mode, lhs, rhs, opts)
			local options = { buffer = bufnr, noremap = true, silent = true }
			if opts then
				options = vim.tbl_extend("force", options, opts)
			end
			vim.keymap.set(mode, lhs, rhs, options)
		end

		-- Navigation
		map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
		map('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
		map('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
		map('n', 'gt', vim.lsp.buf.type_definition, { desc = 'Go to type definition' })
		map('n', 'gr', vim.lsp.buf.references, { desc = 'Show references' })

		-- Documentation and help
		map('n', 'K', vim.lsp.buf.hover, { desc = 'Show hover documentation' })
		map('n', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Show signature help' })
		map('i', '<C-k>', vim.lsp.buf.signature_help, { desc = 'Show signature help' })

		-- Code actions and refactoring
		map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
		map('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })

		-- Formatting
		if client:supports_method('textDocument/formatting') then
			map('n', '<leader>f', function()
				vim.lsp.buf.format({ bufnr = bufnr, id = client.id, timeout_ms = 1000 })
			end, { desc = 'Format buffer' })
		end

		-- Workspace management
		map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, { desc = 'Add workspace folder' })
		map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, { desc = 'Remove workspace folder' })
		map('n', '<leader>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, { desc = 'List workspace folders' })

		-- Auto-format on save if the server supports formatting
		if client:supports_method('textDocument/formatting') then
			-- Only setup format-on-save if server doesn't support willSaveWaitUntil
			if not client:supports_method('textDocument/willSaveWaitUntil') then
				vim.api.nvim_create_autocmd('BufWritePre', {
					group = vim.api.nvim_create_augroup('LspFormat', { clear = false }),
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ 
							bufnr = bufnr, 
							id = client.id, 
							timeout_ms = 1000,
							async = false
						})
						
						-- Force diagnostic refresh after formatting
						vim.schedule(function()
							vim.diagnostic.show(nil, bufnr)
						end)
					end,
				})
			end
		end
	end,
})
