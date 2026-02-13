---@type rainbow_delimiters.config
vim.g.rainbow_delimiters = {
    strategy = {
        [''] = 'rainbow-delimiters.strategy.global',
        vim = 'rainbow-delimiters.strategy.local',
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    -- highlight = {
    --     'RainbowDelimiterRed',
    --     'RainbowDelimiterYellow',
    --     'RainbowDelimiterBlue',
    --     'RainbowDelimiterOrange',
    --     'RainbowDelimiterGreen',
    --     'RainbowDelimiterViolet',
    --     'RainbowDelimiterCyan',
    -- },
    highlight = {
        'markdownH1',
        'markdownH2',
        'markdownH3',
        'markdownH4',
        'markdownH5',
        'markdownH6',
        'markdownEscape',
    },
}

return {
 	"HiPhish/rainbow-delimiters.nvim",
}
