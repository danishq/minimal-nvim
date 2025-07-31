local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

return {
  cmd = { vim.fn.expand('~/tools/clangd_20.1.8/bin/clangd') },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
  root_markers = { 'compile_commands.json', 'compile_flags.txt', '.git' },
  capabilities = capabilities,
}
