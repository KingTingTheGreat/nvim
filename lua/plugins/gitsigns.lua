return {
	"lewis6991/gitsigns.nvim",
	cmd = "Gitsigns",
	lazy = false,
	config = function()
		require("gitsigns").setup()

		vim.keymap.set("n", "<leader>k", ":Gitsigns preview_hunk<CR>", {})
	end,
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
	},
}
