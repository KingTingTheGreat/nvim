return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")

		local find_files_toggle
		find_files_toggle = function(opts, no_ignore)
			opts = opts or {}
			no_ignore = vim.F.if_nil(no_ignore, false)
			opts.attach_mappings = function(_, map)
				map({ "n", "i" }, "<C-h>", function(prompt_bufnr) -- <C-h> to toggle modes
					local prompt = require("telescope.actions.state").get_current_line()
					require("telescope.actions").close(prompt_bufnr)
					no_ignore = not no_ignore
					find_files_toggle({ default_text = prompt }, no_ignore)
				end)
				return true
			end

			if no_ignore then
				opts.no_ignore = true
				opts.hidden = true
				opts.prompt_title = "Find Files <ALL>"
				builtin.find_files(opts)
			else
				opts.prompt_title = "Find Files"
				builtin.find_files(opts)
			end
		end
		vim.keymap.set("n", "<C-p>", find_files_toggle)
		-- vim.keymap.set("n", "<C-p>", builtin.find_files, {})
		--
		vim.keymap.set("n", "<leader>hi", builtin.oldfiles, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		-- local telescope = require("telescope")

		-- telescope.load_extension("media_files")
		-- "nvim-telescope/telescope-media-files.nvim")
		--
		-- require("telescope").setup({
		-- 	extensions = {
		-- 		media_files = {
		-- 			-- fgletypes whitelist
		-- 			-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
		-- 			filetypes = { "png", "webp", "jpg", "jpeg" },
		-- 			-- find command (defaults to `fd`)
		-- 			find_cmd = "rg",
		-- 		},
		-- 	},
		-- })
	end,
}
