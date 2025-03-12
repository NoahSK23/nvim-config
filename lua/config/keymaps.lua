-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

--- Select all text
keymap.set("n", "<leader>a", "ggVG", { desc = "Select all" })

--- Center cursor when moving down/up half-page
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center cursor", buffer = true })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center cursor", buffer = true })
