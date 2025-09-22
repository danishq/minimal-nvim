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
    '-jar', '/home/danish/tools/jdtls/plugins/org.eclipse.equinox.launcher_1.7.0.v20250519-0528.jar',
    '-configuration', '/home/danish/tools/jdtls/config_linux',
    '-data', '/tmp/jdtls-workspace'
  },
  filetypes = { 'java' },
  root_markers = { 'pom.xml', 'build.gradle', '.git', 'mvnw', 'gradlew', 'settings.gradle', 'settings.gradle.kts', 'build.xml', 'MANIFEST.MF' }
}
