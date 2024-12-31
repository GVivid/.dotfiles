-- This make it so that, when nvim is open, it keeps the transparency and blur of the terminal.
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

-- This makes the numbers background the same as the terminal
vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
-- This makes the numbers of the terminal colorful
vim.cmd("hi LineNr ctermfg=2")

return {}
