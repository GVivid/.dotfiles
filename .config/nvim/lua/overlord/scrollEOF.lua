-- This allows neovim to keep the cursor in the middle of the screen even when
-- the cursor should usually be at the bottom.
-- The difference between this and "zz" is that it can do it in insert mode
-- without moving the cursor inconveniently or flickering

--- This calculates the window height, and tries to put it exactly in the
--- middle of the screen; it is off because of rounding, but it should be super
--- close to zz; the main goal is to make it so that pushing zz does nothing
--- when at the bottom, andit gets pretty close.
local function set_scrolloff()
	local winheight = vim.api.nvim_win_get_height(0)

	-- Calculate the desired middle
	local middle = math.floor(winheight / 2)
	if vim.cmdheight == 1 then
		middle = math.ceil(winheight / 2)
	end
	if vim.cmdheight == 0 then
		middle = math.floor(winheight / 2)
	end

	vim.cmd("set scrolloff=" .. middle)
end
-- This allows me to call the function as needed, and makes it easier to remove
-- if I decide to get rid of it later.
function Set_scrolloff()
	set_scrolloff()
end
set_scrolloff()

-- vim.api.nvim_create_autocmd({ "WinResized" }, {
-- 	callback = set_scrolloff,
-- 	desc = "Modifies Scrolloff to Place Cursor in Middle.",
-- })


return {
	'Aasim-A/scrollEOF.nvim',
	event = { 'CursorMoved', 'WinScrolled' },
	-- event = { 'CursorMoved', 'WinScrolled', 'CursorMovedI' },
	opts = { insert_mode = true },
}
