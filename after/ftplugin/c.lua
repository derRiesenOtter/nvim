vim.keymap.set('n', '<leader>c', ':w<CR>:!clang % -o %<<CR>')
vim.keymap.set('n', '<leader>r', ':w<CR>:!./%<<CR>')
vim.keymap.set('n', '<leader>R', ':w<CR>:!clang % -o %< && ./%<<CR>')
