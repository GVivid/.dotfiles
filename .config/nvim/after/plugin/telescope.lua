-- https://github.com/nvim-telescope/telescope.nvim

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Shows Files (not in .gitignore) in Root Folder" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Shows Files in Git" })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Searches Files (not in .gitignore) in Root" })
-- vim.keymap.set('n', '<leader>cs', function()
-- 	builtin.grep_string({ search = vim.fn.input("Grep > "), search_dirs={vim.command("echo b:netrw_curdir")}})
-- end, { desc = "Searches Files (not in .gitignore) in Current Working Directory" })
defaults = {
	vimgrep_arguments = {
		"rg",
		"--color=never",
		"--no-heading",
		"--with-filename",
		"--line-number",
		"--column",
		"--smart-case",
		"--trim" -- add this value
	}
}

vim.keymap.set('n', '<leader>ff', function()
	local opts = {
		find_command = function()
			return {
				'rg',
				'--files',
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case',
				'--no-ignore-vcs',
			}
		end,
		hidden = true,
	}
	builtin.find_files(opts)
end, { desc = "Shows All Files in Root Folder" })

local function grep_string_all_files()
	builtin.grep_string({
		search = vim.fn.input("Grep > "),
		vimgrep_arguments = vim.tbl_flatten({
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--no-ignore", -- Don't respect .gitignore
			"--hidden" -- Include hidden files
		})
	})
end
vim.keymap.set('n', '<leader>fs', grep_string_all_files, { desc = "Grep string (all files, no .gitignore)" })
