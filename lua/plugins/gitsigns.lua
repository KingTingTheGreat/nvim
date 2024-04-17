return {
	"lewis6991/gitsigns.nvim",
	cmd = "Gitsigns",
	config = function()
		require("gitsigns").setup()
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
