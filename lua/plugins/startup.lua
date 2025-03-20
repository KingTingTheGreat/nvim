return {
	"goolord/alpha-nvim",
	config = function()
		local dashboard = require("alpha.themes.dashboard")
		require("alpha").setup(dashboard.config)
		dashboard.section.header.val = {
			[[                                           ,_     _         ]],
			[[                                           |\\_,-~/         ]],
			[[                                           / _  _ |    ,--. ]],
			[[      ██╗████████╗██╗███╗   ██╗ ██████╗   (  @  @ )   / ,-' ]],
			[[      ██║╚══██╔══╝██║████╗  ██║██╔════╝    \  _T_/-._( (    ]],
			[[      ██║   ██║   ██║██╔██╗ ██║██║  ███╗   /         `. \   ]],
			[[ ██   ██║   ██║   ██║██║╚██╗██║██║   ██║  |         _  \ |  ]],
			[[ ╚█████╔╝   ██║   ██║██║ ╚████║╚██████╔╝   \ \ ,  /      |  ]],
			[[  ╚════╝    ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝     || |-_\__   /   ]],
			[[                                           ((_/`(____,-'    ]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("<C-i>", "  New file", "<CMD>Oil --float<CR>"),
			dashboard.button("<C-p>", "󰈞  Find file", ":Telescope find_files <CR>"),
			dashboard.button("<leader>hi", "󰈬  Recently opened files", ":Telescope oldfiles <CR>"),
			dashboard.button("<leader>fg", "󰊄  Live grep", ":Telescope live_grep <CR>"),
			dashboard.button("q", "⏻  Quit Neovim", ":qa<CR>"),
		}
	end,
}
