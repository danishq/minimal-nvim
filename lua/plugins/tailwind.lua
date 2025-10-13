return {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "neovim/nvim-lspconfig",
        "nvim-telescope/telescope.nvim", -- optional
    },
    lazy = true,  -- prevent automatic loading
    config = function()
        local ok, tailwind_tools = pcall(require, "tailwind-tools")
        if not ok then return end

        tailwind_tools.setup({
            lint = true,
            validate = true,
            experimental = {
                classRegex = true,
            },
        })
    end,
}

