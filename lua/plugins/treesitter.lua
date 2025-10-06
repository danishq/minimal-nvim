return {
	"nvim-treesitter/nvim-treesitter",
    build=":TSUpdate",
    config = function()
        require("config.nvimtreesitter").setup()
    end

}
