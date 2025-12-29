-- vim.api.nvim_set_hl(0, 'FlashMatch', { foreground = '#B8B5FF', background = '#4A47A3' })   -- Example for match highlight
-- vim.api.nvim_set_hl(0, 'FlashCurrent', { foreground = '#D0E8F2', background = '#456268' }) -- Example for current match highlight
-- vim.api.nvim_set_hl(0, 'FlashBackdrop', { foreground = '#EEF5FF', background = '#A25772' })   -- Example for label highlight
-- vim.api.nvim_set_hl(0, 'FlashLabel', { foreground = '#EEF5FF', background = '#A25772' })

vim.api.nvim_set_hl(1, 'FlashBackdrop', { foreground = 'lightgreen', background = 'None' }) -- Example for label highlight
return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
		highlight = {
			-- show a backdrop with hl FlashBackdrop
			backdrop = true,
			-- Highlight the search matches
			matches = true,
			-- extmark priority
			priority = 5000,
			groups = {
				match = "FlashMatch",
				current = "FlashCurrent",
				backdrop = "FlashBackdrop",
				label = "FlashLabel",
			},
		},
	},
	keys = {
		-- { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
		{ "<c-s>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		--{ "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
		--{ "r",     mode = { "o" },           function() require("flash").remote() end,            desc = "Remote Flash" },
		--{ "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		--{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
	},
}
