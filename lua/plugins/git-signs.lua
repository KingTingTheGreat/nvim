vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
require("gitsigns").setup({
	signs = {
		add = { text = "+" },
		change = { text = "~" },
		delete = { text = "_" },
		topdelete = { text = "‾" },
		changedelete = { text = "~" },
	},
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, lhs, rhs, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end, { desc = "Jump to next git [c]hange" })

		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end, { desc = "Jump to previous git [c]hange" })

		map("n", "<leader>k", gitsigns.preview_hunk, { desc = "git [p]review hunk" })
	end,
})
