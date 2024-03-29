return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				PATH = "prepend", -- "skip" seems to cause the spawning error
			})
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				lazy = false,
				opts = {
					auto_install = true,
				},
				-- ensure_installed = { "lua_ls", "rust_analyzer", "tailwindcss", "templ", "tsserver", "lemminx", "ocamllsp", "ltex", "jsonls", "gopls", "golanci_lint_ls", "eslint", "dockerls", "cssls", "clangd", "bashls", "pyright" }
				ensure_installed = { "lua_ls", "tsserver", "gopls", "pyright" }
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { 'vim' }
						}
					}
				}
			})
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
			vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
		end
	}
}

-- return {
-- 	{
-- 		"williamboman/mason.nvim",
-- 		lazy = false,
-- 		config = function()
-- 			require("mason").setup()
-- 		end,
-- 	},
-- 	{
-- 		"williamboman/mason-lspconfig.nvim",
-- 		lazy = false,
-- 		opts = {
-- 			auto_install = true,
-- 		},
-- 	},
-- 	{
-- 		"neovim/nvim-lspconfig",
-- 		lazy = false,
-- 		config = function()
-- 			local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- 			local lspconfig = require("lspconfig")
-- 			lspconfig.tsserver.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.html.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.lua_ls.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.rust_analyzer.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.tailwindcss.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.templ.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.pyright.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.gopls.setup({
-- 				capabilities = capabilities,
-- 				cmd = { "gopls" },
-- 				filetypes = { "go", "gomod", "gowork", "gotmpl" },
-- 			})
-- 			lspconfig.golanci_lint_ls.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.dockerls.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.cssls.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.clangd.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.bashls.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.ocamllsp.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.lemminx.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.ltex.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.jsonls.setup({
-- 				capabilities = capabilities
-- 			})
-- 			lspconfig.eslint.setup({
-- 				capabilities = capabilities
-- 			})

-- 			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
-- 			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
-- 			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
-- 			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
-- 		end,
-- 	},
-- }
