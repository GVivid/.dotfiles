-- This makes it so when you push <leader>sl, it shows a little popup box with the rendered latex
local nabla = require('nabla')
-- vim.keymap.set('n','<leader>sl', function()
-- 	nabla.popup()
-- end)

-- This generates the latex inline
nabla.enable_virt({
  autogen = true, -- auto-regenerate ASCII art when exiting insert mode
  silent = true,     -- silents error messages
})
-- Keybind to generate inline latex
vim.keymap.set('n','<leader>r', function()
 	nabla.toggle_virt()
	vim.cmd("normal! zz") -- This is to keep cursor in the middle
end)
