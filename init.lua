-- override vim.notify to ignore lspconfig deprecation warnings
local notify = vim.notify
vim.notify = function(msg, ...)
  if type(msg) == "string" and msg:match("lspconfig") and msg:match("deprecated") then
    return
  end
  notify(msg, ...)
end

require("config.lazy")
require("config.basic")
require("config.keymap")
require("config.cmp")
require("config.autocmd")

--Language Server Protocols
--1. javascript, 2.java, 3.python to be added
vim.lsp.enable({'tsserver','java-lsp', 'clangd','html','css','dart','pylsp'})

vim.g.gruvbox_transparent_bg = false
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme onedark]])
