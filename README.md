# 📝 Neovim Modern Config with JavaScript & Java LSP

This is a modular Neovim configuration designed for a modern, IDE-like experience, with special attention to JavaScript and Java Language Server Protocol (LSP) integration. Native LSP client is used. LSP without MASON.

📁 Directory Structure  
```
~/.config/nvim/
├── init.lua
├── lsp/
│   ├── java-lsp.lua
│   └── tsserver.lua
└── lua/
    ├── config/
    │   ├── basic.lua
    │   ├── keymap.lua
    │   ├── lazy.lua
    │   └── cmp.lua
    └── plugins/
        ├── auto-pair.lua
        ├── completion.lua
        ├── fidget.lua
        ├── gruv.lua
        ├── indent.lua
        ├── surround.lua
        ├── telescope.lua
        └── treesitter.lua
```

🚀 Quick Start  
1. Install Neovim (v0.11 or newer recommended)  
   Neovim installation guide: https://github.com/neovim/neovim/wiki/Installing-Neovim  
2. Clone or Copy This Config  
```sh
git clone https://github.com/danishq/minimal-nvim ~/.config/nvim
```

🧩 Plugin Management  
This config uses lazy.nvim for plugin management.  
Bootstrap lazy.nvim:  
```sh
git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim
```

🌐 JavaScript/TypeScript LSP Setup  
Install the Language Server  
```sh
npm install -g typescript typescript-language-server
```

LSP Config: `lsp/tsserver.lua`  
```lua
--These two line of code below is responsible for auto completion.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- cmd-> name of language server, filetype-> lsp will be activated for these file extensions, root_marker-> recognizes if the folder is project folder.
--EX: for a django project root_markers will be {'manage.py', 'sqlite.db',}
return {
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'package.json', 'tsconfig.json', '.git' },
  capabilities = capabilities,
}
```

☕ Java LSP Setup  
Install Java (JDK 17 or newer required)  
Check with:  
```sh
java -version
```

Download and Extract jdtls  
Go to Eclipse JDT Language Server Snapshots.  
Download the latest `jdt-language-server-latest.tar.gz`.  
Extract to `~/tools/jdtls/` (or your preferred location):  
```sh
mkdir -p ~/tools/jdtls
cd ~/tools/jdtls
wget https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz
tar -xzf jdt-language-server-latest.tar.gz
```

Find the launcher JAR in `plugins/`, e.g.:  
```
cd ~/tools/jdtls/plugins
ls | grep 'launcher'
YOUR_RESULT ~/tools/jdtls/plugins/org.eclipse.equinox.launcher_*.jar
```

LSP Config: `lsp/java-lsp.lua`  
```lua
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
    '-jar', 'YOUR_RESULT',
    '-configuration', '/home/youruser/tools/jdtls/config_linux', --YOUR OPERATING SYSTEM
    '-data', '/home/youruser/.jdtls-workspace'
  },
  filetypes = { 'java' },
  root_markers = {
    'pom.xml', 'build.gradle', '.git',
    'mvnw', 'gradlew', 'settings.gradle',
    'settings.gradle.kts', 'build.xml', 'MANIFEST.MF'
  },
  capabilities = capabilities,
}
```

⚠️ Update the `-jar` and `-configuration` paths to match your system!

✨ VSCode-like Autocompletion  

Install Completion Plugins  
In `lua/plugins/completion.lua`:  
```lua
return {
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
}
```

Configure nvim-cmp  
In `lua/config/cmp.lua`:  
```lua
-- This is what enable the plugins/completion.lua file.
local cmp = require("cmp")
cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
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
    end,
  },
})
```

And in your `init.lua`:  
```lua
-- Add your config.cmp file to .config/nvim/init.lua
require("config.cmp")
```

🛠️ Common Pitfalls & Tips  
- LSP Capabilities: Always add  
  ```lua
  capabilities = require('cmp_nvim_lsp').default_capabilities(...)
  ```
- Correct Paths: For Java, make sure the `-jar` and `-configuration` paths are correct.
- Workspace Folder: The `-data` argument for jdtls can be any directory; it will be created automatically if it doesn’t exist.
- No `.vsix` Files: Do not use `.vsix` files (VSCode extensions) for Neovim LSP. Always install language servers via `npm`, `pip`, or by downloading binaries as described above.
- Popup Completion: If you don’t see popup completion, check that `nvim-cmp` is set up and required, and that LSP capabilities are passed.
- Manual Completion: If you only get completion with `<C-x><C-o>`, your completion plugin isn’t set up or isn’t working.
- Snippets: For VSCode-like “for”/“foreach” snippets, you’ll need to add Java snippets to LuaSnip or use a snippet collection.

🧑‍💻 Usage  
- Open a JS/TS/Java file.
- Start typing—completion should pop up automatically.
- Use `<Tab>/<S-Tab>` to navigate, `<CR>` to accept.
- Use LSP features:
  - `gd` — go to definition
  - `K` — hover docs
  - `<leader>rn` — rename
  - `<leader>ca` — code action

🧩 Adding More Language Servers  
1. Install the language server (check `nvim-lspconfig` server list).  
2. Create a config in `lsp/yourserver.lua` (copy the pattern above).  
3. Add the server name to `vim.lsp.enable({ ... })` in your `init.lua`.

💡 Troubleshooting  
- Run `:checkhealth` in Neovim for diagnostics.  
- Run `:LspInfo` to see active LSP clients.  
- Check your plugin manager (`:Lazy`) for plugin status.

🙏 Credits  
- Neovim  
- lazy.nvim  
- nvim-cmp  
- Eclipse JDT Language Server  
- typescript-language-server  

Happy hacking! 🚀%   
