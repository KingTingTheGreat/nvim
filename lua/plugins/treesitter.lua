return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
	local config = require("nvim-treesitter.configs")
	config.setup({
	    ensure_installed = { "lua", "javascript", "python", "typescript", "go", "bash", "css", "html" },
	    sync_install = false,
	    indent = { enable = true },
	    highlight = { enable = true },
	    matchup = { enable = true },
	    auto_install = true,
	    ignore_install = {},
	    autotag = {
		enable = true,
		enable_rename = true,
		enable_close = true,
		enable_close_on_slash = true,
		filetypes = {
		    'html',
		    'javascript',
		    'typescript',
		    'javascriptreact',
		    'typescriptreact',
		    'tsx',
		    'jsx',
		    'xml',
		    'markdown',
		}
	    },
	})
    end
}
