local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

return {
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    '-jar', '/home/danish/tools/sts-4.32.0.RELEASE/plugins/org.springframework.tooling.boot.ls_1.64.0.202509050658/servers/spring-boot-language-server/spring-boot-language-server-1.64.0-SNAPSHOT-exec.jar',
    '-configuration', '/home/danish/tools/sts-4.32.0.RELEASE/configuration',
    '-data', '/tmp/springboot-workspace'
  },
  filetypes = { 'java' },
  root_dir = function(fname)
    return require('lspconfig.util').root_pattern(
      'pom.xml', 'build.gradle', '.git'
    )(fname)
  end,
  capabilities = capabilities,
  settings = {
    java = {},
    spring = {
      boot = { enabled = true }
    }
  }
}

