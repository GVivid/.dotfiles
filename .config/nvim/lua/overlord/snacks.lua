--vim.api.nvim_set_hl(0, 'SnacksImageMath', {fg="#ff0000" ,default=true})
-- vim.api.nvim_set_hl(0, 'SnacksImageMath', {fg="#ffffff" ,default=true})
---- vim.api.nvim_set_hl(0, 'SnacksImageMath', { link = "Normal", default = true })
-- vim.api.nvim_set_hl(0, 'SnacksImageMath', {fg="#000000" ,default=true})
vim.api.nvim_set_hl(0, 'SnacksImageMath', { fg = "#ffffff", default = true })

return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		image = {
			doc = { -- enable image viewer for documents
				-- a treesitter parser must be available for the enabled languages.
				enabled = true,
				-- render the image inline in the buffer
				-- if your env doesn't support unicode placeholders, this will be disabled
				-- takes precedence over `opts.float` on supported terminals
				inline = false,
				-- inline = true,
				-- render the image in a floating window
				-- only used if `opts.inline` is disabled
				float = true,
				-- max_width = 80,
				-- max_height = 40,
				-- Set to `true`, to conceal the image text when rendering inline.
				conceal = true, -- (experimental)
			},

			enabled = true,
			-- table<string,snacks.image.args>
			magick = {
				-- default = { "{src}[0]", "-scale", "720x480>" }, -- default for raster images
				default = { "{src}[0]", "-scale", "1920x1080>" }, -- default for raster images
				vector = { "-density", 192, "{src}[0]" }, -- used by vector images like svg
				math = { "-density", 192, "{src}[0]", "-trim" },
				-- math = { "-density", 192, "{src}[0]", "-background", "none", "-trim" },
				--				pdf = { "-density", 192, "{src}[0]", "-background", "none", "-alpha", "remove", "-trim" },
				pdf = { "-density", 192, "{src}[0]", "-background", "none", "-alpha", "remove" },
			},

		},
		bigfile = { enabled = false },
		dashboard = { enabled = false },
		debug = { enabled = true },
		explorer = { enabled = false },
		indent = {
			enabled = true,
			animate = {
				enabled = false,
				--enabled = vim.fn.has("nvim-0.10") == 1,
			--	style = "out",
			--	easing = "linear",
			--	duration = {
			--		step = 20, -- ms per step
			--		total = 100, -- maximum duration
			--	},
			},

		},
		input = { enabled = false },
		picker = { enabled = false },
		notifier = { enabled = false },
		quickfile = { enabled = true },
		scope = { enabled = false },
		scroll = { enabled = false },
		statuscolumn = { enabled = false },
		words = { enabled = false },
	},
}
