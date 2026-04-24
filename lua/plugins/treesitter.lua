vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})
local ensure_installed = {
	"lua",
	"javascript",
	"javascriptreact",
	"python",
	"typescript",
	"typescriptreact",
	"go",
	"bash",
	"css",
	"html",
	"markdown",
	"markdown_inline",
	"vim",
	"vimdoc",
	"diff",
	"luadoc",
}
require("nvim-treesitter").setup({
	ensure_installed = ensure_installed,
	sync_install = false,
	indent = { enable = true },
	highlight = { enable = true },
	matchup = { enable = true },
	auto_install = true,
	ignore_install = {},
})
-- local config = require("nvim-treesitter.config")
--
-- local already_installed = config.get_installed()
-- local parsers_to_install = {}
--
-- for _, parser in ipairs(ensure_installed) do
-- 	if not vim.tbl_contains(already_installed, parser) then
-- 		table.insert(parsers_to_install, parser)
-- 	end
-- end
