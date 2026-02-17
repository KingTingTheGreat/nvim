return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = {
			"lua",
			"javascript",
			"python",
			"typescript",
			"go",
			"bash",
			"css",
			"html",
			"markdown",
			"markdown_inline",
			"vim",
			"vimdoc",
			"diff",
			"luadoc",
		},
		sync_install = false,
		indent = { enable = true },
		highlight = { enable = true },
		matchup = { enable = true },
		auto_install = true,
		ignore_install = {},
	},
	config = function()
		require("flash").treesitter()
	end,
}
