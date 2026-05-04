vim.pack.add({
	"https://github.com/nvim-lua/popup.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-media-files.nvim",
})
local builtin = require("telescope.builtin")

local function find_files_toggle(opts, no_ignore)
	opts = opts or {}
	no_ignore = vim.F.if_nil(no_ignore, false)

	opts.attach_mappings = function(_, map)
		map({ "n", "i" }, "<C-h>", function(prompt_bufnr)
			local prompt = require("telescope.actions.state").get_current_line()
			require("telescope.actions").close(prompt_bufnr)
			find_files_toggle({ default_text = prompt }, not no_ignore)
		end)
		return true
	end

	if no_ignore then
		opts.no_ignore = true
		opts.hidden = true
		opts.prompt_title = "Find Files <ALL>"
	else
		opts.prompt_title = "Find Files"
	end

	builtin.find_files(opts)
end

vim.api.nvim_create_user_command("FindFilesToggle", function()
	find_files_toggle()
end, {})

vim.keymap.set("n", "<C-p>", "<cmd>FindFilesToggle<CR>")
vim.keymap.set("n", "<C-p>", find_files_toggle)
vim.keymap.set("n", "<leader>hi", builtin.oldfiles)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)

-- check github for image preview deps
-- https://github.com/nvim-telescope/telescope-media-files.nvim
require("telescope").load_extension("media_files")
require("telescope").setup({
	extensions = {
		media_files = {
			filetypes = { "png", "webp", "jpg", "jpeg", "webm", "mp4", "pdf" },
		},
		find_cmd = "rg",
	},
})
