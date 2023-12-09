-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.keymap.set('n', '<Leader>w', ":w<CR>:q<CR>")
vim.keymap.set('n', '<Leader>t', ':term<CR>')
vim.keymap.del("n", "]b", {})
vim.keymap.del("n", "[b", {})

vim.keymap.set("n", "<Leader>f", ":bn<CR>")
vim.keymap.set("n", "<Leader>g", ":bp<CR>")
vim.keymap.set("n", "<Leader>bd", ":bd<CR>")

vim.keymap.set("n", "<Leader>rf", ":RunFile<CR>")
vim.keymap.set("n", "<Leader>vc", ":VimtexCompile<CR>")
