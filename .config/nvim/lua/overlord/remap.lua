vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv",vim.cmd.Ex)
vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>', defaults)
vim.keymap.set("n","j","gj")
vim.keymap.set("n","k","gk")

-- Reformat tables
vim.keymap.set("x", "<leader>tf","<cmd>'<,'>:!sed 's/|/@|/g'  | column -s '@' -t<CR>")

-- Format file
vim.keymap.set("n", "=","<cmd>LspZeroFormat<CR>")
return {}
