vim.keymap.set('', ',e', ':NvimTreeOpen<CR>')
vim.keymap.set('', ',f', ':NvimTreeOpen<CR>')
vim.keymap.set('', ',t', ':NvimTreeToggle<CR>')
vim.keymap.set('', '<leader>av', ':AnsibleVault<cr>')
vim.keymap.set('', '<leader>au', ':AnsibleUnvault<cr>')

vim.keymap.set('', '<leader>q', ':botright copen<cr>', { noremap = false })
vim.keymap.set('', '<leader>Q', ':cclose<cr>', { noremap = false })

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = false })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = false })
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = false })
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = false })
