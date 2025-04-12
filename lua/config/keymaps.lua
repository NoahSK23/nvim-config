-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

--- Select all text
keymap.set("n", "ga", "ggVG", { desc = "Select all" })

--- Use alt/option backspace to delete word in insert mode
keymap.set("i", "<M-BS>", "<C-W>", { noremap = true, silent = true })

--- Exit insert mode with jk and jj
keymap.set("i", "jj", "<ESC>", { noremap = false, desc = "Exit insert mode" })

--- Go to buffer at position
for i = 1, 9 do
  keymap.set("n", "g" .. i, "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>", { desc = "Go to buffer " .. i })
end

--- Center cursor when moving down/up half-page
-- keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump half page down" })
-- keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump half page up" })
