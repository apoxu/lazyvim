-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local map = vim.keymap.set
vim.keymap.del({ "x", "n" }, ",")

-- disable macro recording of neovim
vim.keymap.set("n", "q", "<Nop>", { noremap = true })

local wk = require("which-key")
vim.keymap.set("n", ",", '<cmd>lua require("which-key").show(",", {mode = "n", auto = true})<cr>')
wk.register({
  [","] = {
    w = { "<cmd>w<cr>", "Save current buffer" },
  },
  ["<leader>;"] = { '<cmd>lua require("alpha").start()<cr>', "Dashboard" },
})
