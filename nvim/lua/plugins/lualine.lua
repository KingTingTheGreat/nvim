vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })
require("lualine").setup({
	options = {
		theme = "auto",
	},
	sections = {
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 1,
			},
		},
	},
})
