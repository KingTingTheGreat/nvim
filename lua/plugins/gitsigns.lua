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
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
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

			map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })
			map("n", "<leader>tD", gitsigns.preview_hunk_inline, { desc = "[T]oggle git show [D]eleted" })
			map("n", "<leader>hb", gitsigns.blame_line, { desc = "git [b]lame line" })

			map("v", "<leader>hr", function()
				gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
			end, { desc = "git [r]eset hunk" })
			map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "git [r]eset hunk" })

			map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "git [p]review hunk" })
		end,
	},
}
