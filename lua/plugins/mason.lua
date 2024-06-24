return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = { "clangd", "jdtls","tsserver" },
            }
        end
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        config = function()
            require('mason-tool-installer').setup {
                ensure_installed = { "java-debug-adapter","java-test","js-debug-adapter"}
            }
        end
    }
}