-- return {
-- 	"nvim-telescope/telescope-media-files.nvim",
-- 	dependencies = {
-- 		"nvim-lua/popup.nvim",
-- 		"nvim-lua/plenary.nvim",
-- 		"nvim-telescope/telescope.nvim",
-- 		"nvim-telescope/telescope-media-files.nvim",
-- 	},
-- 	config = function()
-- 		require("telescope").load_extension("media_files")
-- 	end,
-- }
--
return {
	"dharmx/telescope-media.nvim",
	config = function()
		require("telescope").load_extension("media")
	end,
}
