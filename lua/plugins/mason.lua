return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- import mason-lspconfig
        local mason_lspconfig = require("mason-lspconfig")

        local mason_tool_installer = require("mason-tool-installer")

        -- enable mason and configure icons
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "tsserver",
                "html",
                "cssls",
                "tailwindcss",
                "svelte",
                -- "lua_ls",
                "graphql",
                -- "emmet_ls",
                "prismals",
                "pyright",
                "gopls",
                "jsonls",
                -- "ocamllsp",
                -- "ltex",
                "bashls",
                "clangd",
                "eslint",
                "dockerls",
                "rust_analyzer",
                "templ",
                -- "java_language_server",
                "jdtls",
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                "prettier", -- prettier formatter
                "stylua",   -- lua formatter
                "isort",    -- python formatter
                "black",    -- python formatter
                "pylint",
                "eslint_d",
            },
        })

        -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        -- vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, {})
        -- vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, {})
        -- vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end,
}
