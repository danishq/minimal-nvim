local cmp = require("cmp")
cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Enter to accept
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
})
