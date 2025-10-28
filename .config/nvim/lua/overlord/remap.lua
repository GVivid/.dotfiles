vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "File Explorer" })
vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>', defaults)
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

-- Reformat tables
vim.keymap.set("x", "<leader>tf", "<cmd>'<,'>:!sed 's/|/@|/g'  | column -s '@' -t<CR>")

-- Setup Language Servers for Formatting
vim.keymap.set("n", "-", "<cmd>LspZeroSetupServers<CR>")
-- Format file
vim.keymap.set("n", "=", "<cmd>LspZeroFormat<CR>")
return {}
