-- call s:h("@org.headline.level1.org",{"fg": s:head_a})
-- call s:h("@org.headline.level2.org",{"fg": s:head_b})
-- call s:h("@org.headline.level3.org",{"fg": s:head_c})
-- call s:h("@org.headline.level4.org",{"fg": s:head_d})
-- call s:h("@org.headline.level5.org",{"fg": s:head_e})
-- call s:h("@org.headline.level6.org",{"fg": s:head_f})

vim.api.nvim_set_hl(0, '@org.headline.level1.org', { link = "MarkdownH1" }) -- Example for label highlight
vim.api.nvim_set_hl(0, '@org.headline.level2.org', { link = "MarkdownH2" })
vim.api.nvim_set_hl(0, '@org.headline.level3.org', { link = "MarkdownH3" })
vim.api.nvim_set_hl(0, '@org.headline.level4.org', { link = "MarkdownH4" })
vim.api.nvim_set_hl(0, '@org.headline.level5.org', { link = "MarkdownH5" })
vim.api.nvim_set_hl(0, '@org.headline.level6.org', { link = "MarkdownH6" })

return {
	'nvim-orgmode/orgmode',
	event = 'VeryLazy',
	ft = { 'org' },
	config = function()
		local org_root = '~/Documents/Org/'
		require('orgmode').setup({
			org_agenda_files = org_root .. '*',
			org_default_notes_file = org_root .. 'Inbox.org',
			org_capture_templates = {
				t = {
					description = 'Todo',
					template = '** TODO %^{Task}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?',
					target = org_root .. 'Inbox.org',
					headline = 'Inbox'
				},
				f = {
					description = 'Fleeting',
					template = '** IDEA %^{Idea}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?',
					target = org_root .. 'Ideas.org',
					headline = 'Fleeting'
				},
				d = {
					description = 'Deadline',
					template =
					'** TODO %^{task}\nDEADLINE: %^{deadline}t\n:PROPERTIES:\n:CREATED: %u\n:CAPTURED: %a\n:END:\n%?',
					target = org_root .. 'Calendar.org',
					headline = 'Deadlines'
				},
				p = {
					description = 'Project',
					template = '* PROJ %^{Project name}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n** TODO %?',
					target = org_root .. 'Projects.org',
					headline = 'Projects'
				},
				i = {
					description = 'Idea',
					template = '** IDEA %^{Idea}\n:PROPERTIES:\n:CREATED: %U\n:CAPTURED: %a\n:END:\n%?',
					target = org_root .. 'Ideas.org',
					headline = 'Ideas'
				}
			}
		})

		-- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
		-- add ~org~ to ignore_install
		-- require('nvim-treesitter.configs').setup({
		--    ensure_installed = 'all',
		--    ignore_install = { 'org' },
		-- })
	end,
}
