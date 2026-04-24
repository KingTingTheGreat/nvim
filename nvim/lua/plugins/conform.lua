vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "gofmt" },
		templ = { "templ" },
		json = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		svg = { "prettierd", "prettier", stop_after_first = true },
		scss = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		java = { "google-java-format" },
		astro = { "prettier" },
		rust = { "rustfmt" },
	},
	format_on_save = {
		timeout_ms = 5000,
	},
})
