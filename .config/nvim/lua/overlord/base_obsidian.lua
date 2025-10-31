return {
	"obsidian-nvim/obsidian.nvim",
	version = "*",
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Main Vault",
				-- path = -- path to main vault.
			}
		},
		ui = { enable = false}
	},
	lazy = true,
	ft = "markdown"
}
