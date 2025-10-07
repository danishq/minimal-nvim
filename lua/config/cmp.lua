--local cmp = require("cmp")
--cmp.setup({
--  mapping = {
--    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter to accept
--    ['<Tab>'] = cmp.mapping.select_next_item(),
--    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
--  },
--  sources = {
--    { name = 'nvim_lsp' },
--    { name = 'luasnip' },
--  },
--  snippet = {
--    expand = function(args)
--      require('luasnip').lsp_expand(args.body)
--      require("luasnip.loaders.from_vscode").lazy_load()
--    end,
--  },
--})
--


--local cmp = require("cmp")
--local luasnip = require("luasnip")
--
---- Load vscode-style snippets from friendly-snippets
--require("luasnip.loaders.from_vscode").lazy_load()
--
--cmp.setup({
--  snippet = {
--    expand = function(args)
--      luasnip.lsp_expand(args.body)
--    end,
--  },
--  mapping = {
--    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter to accept
--    ['<Tab>'] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_next_item()
--      elseif luasnip.expand_or_jumpable() then
--        luasnip.expand_or_jump()
--      else
--        fallback()
--      end
--    end, { "i", "s" }),
--
--    ['<S-Tab>'] = cmp.mapping(function(fallback)
--      if cmp.visible() then
--        cmp.select_prev_item()
--      elseif luasnip.jumpable(-1) then
--        luasnip.jump(-1)
--      else
--        fallback()
--      end
--    end, { "i", "s" }),
--  },
--  sources = {
--    { name = 'nvim_lsp' },
--    { name = 'luasnip' }, -- make sure LuaSnip is a source
--  },
--})
--

local cmp = require("cmp")
local luasnip = require("luasnip")

-- Load vscode-style snippets from friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Enter to accept

    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  -- ✅ Add path as a completion source
  sources = cmp.config.sources({
    { name = "path" },
    { name = "nvim_lsp" },
    { name = "luasnip" },      -- <── enables file/folder completion
  }, {
    { name = "buffer" },
  }),
})

-- ✅ Enable command-line completion for :
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },      -- file/folder completion in :
  }, {
    { name = "cmdline" },   -- command completion in :
  }),
})

-- ✅ Optional: completion for `/` search
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

