local options = vim.opt
options.tabstop = 3
options.softtabstop = 0
options.shiftwidth = 3
options.expandtab = false
options.clipboard = "unnamedplus"
options.wrap = false
options.fillchars = "eob: "

vim.g.mapleader = " "

-- Navigate vim panes better
vim.keymap.set('n', '<leader>k', ':wincmd k<CR>')
vim.keymap.set('n', '<leader>j', ':wincmd j<CR>')
vim.keymap.set('n', '<leader>h', ':wincmd h<CR>')
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>')

vim.keymap.set('n', '<leader><esc>', ':nohlsearch<CR>')
vim.wo.number = true

-- tabs :3
vim.keymap.set('n', '<leader>t', ':$tabnew<CR>')
vim.keymap.set('n', '<leader>w', ':tabclose<CR>')
vim.keymap.set('n', '<leader>W', ':tabonly<CR>')
vim.keymap.set('n', '<leader>1', ':tabnext 1<CR>')
vim.keymap.set('n', '<leader>2', ':tabnext 2<CR>')
vim.keymap.set('n', '<leader>3', ':tabnext 3<CR>')
vim.keymap.set('n', '<leader>4', ':tabnext 4<CR>')
vim.keymap.set('n', '<leader>5', ':tabnext 5<CR>')
vim.keymap.set('n', '<leader>6', ':tabnext 6<CR>')
vim.keymap.set('n', '<leader>7', ':tabnext 7<CR>')
vim.keymap.set('n', '<leader>8', ':tabnext 8<CR>')
vim.keymap.set('n', '<leader>9', ':tabnext 9<CR>')
