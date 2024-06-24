return {  
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({})
            --lspconfig.tsserver.setup({})
            --lspconfig.jdtls.setup({})
        end
    }
}