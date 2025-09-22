local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
return {
  cmd = { 'pylsp', '--stdio' },
  filetypes = {'py'},
  root_markers = { 'manage.py','package.json', '.git' },
}
