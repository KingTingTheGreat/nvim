return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		lspconfig.gleam.setup({})

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				-- opts.desc = "Go to declaration"
				-- keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
				--
				opts.desc = "Show LSP definitions"
				keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

				-- opts.desc = "Show LSP implementations"
				-- keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- (not in youtube nvim video)
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		-- for type, icon in pairs(signs) do
		-- 	local hl = "DiagnosticSign" .. type
		-- 	-- vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		-- 	vim.diagnostic.config({ text = icon, texthl = hl })
		-- end
		-- Set diagnostic signs using vim.diagnostic.config
		vim.diagnostic.config({
			signs = {
				active = {
					-- Define signs for each diagnostic type
					{ name = "DiagnosticSignError", text = signs.Error },
					{ name = "DiagnosticSignWarn", text = signs.Warn },
					{ name = "DiagnosticSignHint", text = signs.Hint },
					{ name = "DiagnosticSignInfo", text = signs.Info },
				},
			},
		})

		-- lspconfig.lua_ls.setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	settings = {
		-- 		Lua = {
		-- 			runtime = {
		-- 				version = "LuaJIT",
		-- 			},
		-- 			diagnostics = {
		-- 				globals = {
		-- 					"vim",
		-- 					"require",
		-- 				},
		-- 			},
		-- 			completion = {
		-- 				callSnippet = "Replace",
		-- 			},
		-- 		},
		-- 	},
		-- })
		-- lspconfig.ts_ls.setup({
		-- 	capabilities = capabilities,
		-- 	on_attach = on_attach,
		-- 	settings = {
		-- 		-- TypeScript-specific settings
		-- 		tsserver = {
		-- 			diagnostics = {
		-- 				globals = {
		-- 					"vim",
		-- 					"require",
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- })
		-- lspconfig.gopls.setup({
		-- 	on_attach = on_attach,
		-- 	capabilities = capabilities,
		-- 	settings = {
		-- 		gopls = {
		-- 			["ui.inlayhint.hints"] = {
		-- 				compositeLiteralFields = true,
		-- 				constantValues = true,
		-- 				parameterNames = true,
		-- 			},
		-- 		},
		-- 	},
		-- })

		-- mason_lspconfig.setup_handlers({
		-- 	-- default handler for installed servers
		-- 	function(server_name)
		-- 		lspconfig[server_name].setup({
		-- 			capabilities = capabilities,
		-- 		})
		-- 	end,
		-- 	-- ["emmet_ls"] = function()
		-- 	--     -- configure emmet language server
		-- 	--     lspconfig["emmet_ls"].setup({
		-- 	--         capabilities = capabilities,
		-- 	--         filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		-- 	--     })
		-- 	-- end,
		-- 	["jdtls"] = function()
		-- 		-- configure java language server
		-- 		lspconfig["jdtls"].setup({
		-- 			capabilities = capabilities,
		-- 			filetypes = { "java" },
		-- 		})
		-- 	end,
		-- })
	end,
}
