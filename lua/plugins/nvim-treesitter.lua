return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = { "NvimTreeOpen", "NvimTreeToggle" },
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "cpp", "java", "javascript", "c_sharp" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true }, 
        })
    end
}