return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = {
                "lua_ls",
                "clangd",
                "basedpyright",
                "eslint",
                "superhtml",
                "harper_ls",
                "kotlin_language_server",
            },
            automatic_enable = true,
        },
    },

    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()

            -- Lua
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })

            -- Python
            vim.lsp.config("basedpyright", {
                capabilities = capabilities,
            })

            -- ESLint
            vim.lsp.config("eslint", {
                capabilities = capabilities,
            })

            -- Kotlin
            vim.lsp.config("kotlin_language_server", {
                capabilities = capabilities,
            })

            -- Clang
            vim.lsp.config("clangd", {
                capabilities = capabilities,
            })

            -- HTML
            vim.lsp.config("superhtml", {
                capabilities = capabilities,
            })

            -- Grammar / prose
            vim.lsp.config("harper_ls", {
                capabilities = capabilities,
            })

            -- Enable servers
            vim.lsp.enable("lua_ls")
            vim.lsp.enable("basedpyright")
            vim.lsp.enable("eslint")
            vim.lsp.enable("kotlin_language_server")
            vim.lsp.enable("clangd")
            vim.lsp.enable("superhtml")
            vim.lsp.enable("harper_ls")

            -- Keymaps
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set(
                { "n", "v" },
                "<leader>ca",
                vim.lsp.buf.code_action,
                {}
            )
        end,
    },
}
