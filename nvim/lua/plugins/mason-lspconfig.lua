vim.pack.add({ "https://github.com/mason-org/mason-lspconfig.nvim" })
require("mason-lspconfig").setup({
	automatic_enable = true,
	-- automatic_enable = {
	-- 	exclude = {},
	-- },
})
