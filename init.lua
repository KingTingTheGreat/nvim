vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.o.mouse = "a"

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.number = true
vim.o.relativenumber = true

vim.o.autoindent = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4

vim.o.wrap = true
vim.o.linebreak = true
vim.o.breakindent = true

vim.o.termguicolors = true
vim.o.background = "dark"

vim.o.scrolloff = 10

vim.o.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.o.undofile = true

vim.o.showmode = false

vim.o.signcolumn = "yes"

vim.o.list = false
-- vim.opt.listchars = {}

vim.o.inccommand = "split"

vim.o.cursorline = true

vim.o.confirm = true

-- vim.opt.clipboard = "unnamedplus"

-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },

	-- Can switch between these as you prefer
	virtual_text = true, -- Text shows up at the end of the line
	virtual_lines = false, -- Text shows up underneath the line, with virtual lines

	-- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
	jump = { float = true },
})

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Navigation keymaps
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

require("core.autocmd")
require("core.lsp")

--------------------
-- PLUGINS
--------------------

---- mason
require("plugins.mason")
require("plugins.nvim-lspconfig")
require("plugins.mason-lspconfig")
require("plugins.mason-tool-installer")

require("plugins.telescope")

require("plugins.treesitter")

require("plugins.autocomplete")
require("plugins.copilot")

require("plugins.oil")
require("plugins.web-devicons")

require("plugins.neotab")
require("plugins.autopairs")
require("plugins.autotag")
require("plugins.template-string")
require("plugins.surround")

require("plugins.conform")

require("plugins.render-markdown")
require("plugins.rainbow-indent")
require("plugins.rainbow-delimiters")
require("plugins.colorizer")

require("plugins.lualine")
require("plugins.alpha")
require("plugins.theme")

require("plugins.git-signs")
require("plugins.git-blame")

require("plugins.flash")

require("plugins.wilder")
require("plugins.which-key")

require("vim._core.ui2").enable({})
