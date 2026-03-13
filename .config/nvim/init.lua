vim.opt.termguicolors = true
--vim.cmd("colorscheme challenger_deep")
vim.cmd("colorscheme monodeep")
--require("overlord")
require("config.lazy")
-- This make it so that, when nvim is open, it keeps the transparency and blur of the terminal.
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi LineNr guibg=NONE ctermbg=NONE")
vim.cmd("hi Error guibg=NONE ctermbg=NONE")
vim.cmd("hi ErrorMsg guibg=NONE ctermbg=NONE")
vim.cmd("hi Folded guibg=NONE ctermbg=NONE")

-- vim.cmd("hi ColorColumn guibg=s:asphalt ctermbg=NONE")
-- vim.cmd("hi ColorColumn guibg=blue blend=50%")

-- Makes searching faster by not searching the entire document all at once, only the next element
vim.cmd("set incsearch")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
-- Make tabs smaller
vim.cmd("set tabstop=4")
vim.cmd("set shiftwidth=4")
-- Make it so vim does not wrap in the middle of a word
vim.cmd("set linebreak")

-- For when I do not want to wrap text.
-- vim.cmd("set nowrap")

-- Soft wrapping text
vim.cmd("set wrap")

-- This sets the black bar on the right so I can organize my text
-- for when I do not want to wrap text.
--- vim.cmd("set cc=80")

-- Makes the text wrap at 79, which is before the black line
-- vim.cmd("set textwidth=79")

vim.cmd("set lazyredraw")
-- Persistent undo tree | Files stored in $HOME/.config/nvim/.undo
local prefix = vim.fn.expand("~/")
vim.opt.undodir = { prefix .. "/.undo//" }
vim.cmd("set undofile")
vim.cmd("set cmdheight=0")


-- This might be helpful if you start using marks a lot.
-- https://github.com/BartSte/nvim-project-marks

---
---- This lets me lazyload tree sitter and plenary
--- This was found here: https://www.reddit.com/r/neovim/comments/n8a094/a_simple_trick_to_load_source_code_with_neovimvim/
--- It is a neat idea.
function lazyload()
	--	print("I am lazy")
	vim.cmd([[syntax on]])
	local plugins = "plenary.nvim nvim-treesitter"
end

vim.cmd([[autocmd User LoadLazyPlugin lua lazyload()]])

vim.cmd([[autocmd User RedrawScreen colorscheme aurora]])


vim.defer_fn(function()
	vim.cmd([[doautocmd User LoadLazyPlugin]])
end, 80)
vim.defer_fn(function()
	vim.cmd([[doautocmd ColorScheme]])
end, 120)


-- Automatically turn on colorizer
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = "*",
--   callback = function()
--     require("colorizer").attach_to_buffer(0)
--   end,
-- })
