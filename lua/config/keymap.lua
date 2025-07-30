vim.keymap.set("n","<leader>e","<CMD>Explor<CR>")
vim.keymap.set("n","<leader>Q","<CMD>wqa<CR>")


--Telescope
vim.keymap.set("n", "<leader>ff", "<CMD>Telescope find_files<CR>", { desc = 'Telescope find files' })
vim.keymap.set("n", "<leader>fg", "<CMD>Telescope live_grep<CR>", { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', "<CMD>Telescope builtin<CR>", { desc = 'Telescope buffers' })
--vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


-- Universal Paste
vim.keymap.set({ 'n','v', 'x' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set({ 'n','v', 'x' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard after the cursor position' })
vim.keymap.set({ 'n','v', 'x' }, '<leader>P', '"+P', { desc = 'Paste from system clipboard before the cursor position' })


vim.keymap.set("n","<C-j>","<C-w>j")
vim.keymap.set("n","<C-k>","<C-w>k")
vim.keymap.set("n","<C-h>","<C-w>h")
vim.keymap.set("n","<C-l>","<C-w>l")

-- Code Action & LSP
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = bufnr })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})

-- NeoTree Keymap
vim.keymap.set("n", "<leader>ne", "<CMD>Neotree<CR>", { desc = 'Open NeoTree Navigation' })
vim.keymap.set("n", "<leader>nn", "<CMD>Neotree close<CR>", { desc = 'Close NeoTree Navigation' })


-- Terminal Window Floating
vim.keymap.set("n", "<leader>gt", "<CMD>ToggleTerm size=40 dir=~/Desktop direction=float name=desktop<CR>", { desc = 'Open Terminal in Floating Window' })
vim.keymap.set("n", "<leader>gtt", "<CMD>close<CR>", { desc = 'Close Terminal Window' })
