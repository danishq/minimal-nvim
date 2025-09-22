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

--TreeSitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "javascript" , "java", "c", "cpp", "lua", "vim", "markdown", "markdown_inline" ,"html"},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = {  },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
				return true
		end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

vim.g.gruvbox_transparent_bg = false
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme onedark]])
