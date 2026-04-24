---- lsp
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
		},
	},
})

vim.lsp.enable({ "lua_ls", "gopls", "jsonls" })
vim.opt.completeopt = "menu,menuone,noselect,popup" -- Ensures the menu appears even for a single match and uses the native popup window.
vim.o.autocomplete = true -- Enables the overall completion feature.
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_completion", { clear = true }),
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client then
			-- Conform is the formatter of record in this config.
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false

			if client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
				pcall(vim.lsp.inlay_hint.enable, true, { bufnr = ev.buf })
			end

			if client:supports_method("textDocument/completion") then
				-- Enable native LSP completion for this client + buffer
				vim.lsp.completion.enable(true, ev.data.client_id, ev.buf, {
					autotrigger = true, -- auto-show menu as you type (recommended)
					-- You can also set { autotrigger = false } and trigger manually with <C-x><C-o>
				})
			end
		end

		local bufnr = ev.buf
		local map = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
		end

		map("n", "K", vim.lsp.buf.hover, "Show documentation for what is under cursor")

		map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
		map("n", "gr", vim.lsp.buf.references, "References")

		map("n", "gr", "<cmd>Telescope lsp_references<CR>", "Show LSP references")

		local function goto_definition_single()
			local params = vim.lsp.util.make_position_params()
			vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result)
				if err then
					return
				end
				if not result or vim.tbl_isempty(result) then
					return
				end

				if vim.tbl_islist(result) and #result == 1 then
					vim.lsp.util.jump_to_location(result[1], "utf-8")
				else
					vim.lsp.util.set_qflist(vim.lsp.util.locations_to_items(result, "utf-8"))
					vim.cmd("copen")
				end
			end)
		end
		map("n", "gd", goto_definition_single, "Go to definition")
		-- map("n", "gd", vim.lsp.buf.definition, "Go to definition")

		map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions")

		map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")

		map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")

		map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics")

		map("n", "<leader>d", vim.diagnostic.open_float, "Show line diagnostics")

		map("n", "[d", vim.diagnostic.goto_prev, "Go to previous diagnostic")

		map("n", "]d", vim.diagnostic.goto_next, "Go to next diagnostic")

		map("n", "<leader>rs", "<cmd>LspRestart<CR>", "Restart LSP")
	end,
})
