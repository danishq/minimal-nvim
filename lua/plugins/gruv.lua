--return {
--  "folke/tokyonight.nvim",
--  lazy = false,
--  priority = 1000,
--  opts = {},
--}
--


return {
  "olimorris/onedarkpro.nvim",
  priority = 1000, -- Ensure it loads first
  config = function()
      require("onedarkpro").setup({
          styles = {
              types = "italic",
              methods = "NONE",
              numbers = "NONE",
              strings = "NONE",
              comments = "italic",
              keywords = "bold,italic",
              constants = "NONE",
              functions = "italic",
              operators = "NONE",
              variables = "NONE",
              parameters = "NONE",
              conditionals = "italic",
              virtual_text = "NONE",
          },
          highlights = {
              Directory = {italic = true }
          },
          options = {
              cursorline = true,
              terminal_colors=false,
              transparency = false,
          }
      })
  end
}
