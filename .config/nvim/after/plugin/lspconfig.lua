local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

lsp_zero.extend_lspconfig({
    sign_text = true,
    lsp_attach = lsp_attach,
    capabilities = require('cmp_nvim_lsp').default_capabilities()
})

---
--- LSP Server Registrations (Nix-friendly)
---

-- Define LSP configuration map
-- Map server name to the corresponding binary name
-- name = "IN NVIM"
local lsp_servers = {
  { name = "nil_ls", binary = "nil" },
  { name = "ruff",   binary = "ruff" },
  { name = "ty",     binary = "ty" },
  { name = "roslyn-language-server",     binary = "roslyn-ls" }
}

-- LSP configuration definitions
local configs = {
  nil_ls = { filetypes = { "nix" } },
  ruff = {},
  ty = {}
}

-- Iterate and enable if binary exists in PATH
for _, server in ipairs(lsp_servers) do
  if vim.fn.executable(server.binary) == 1 then
    vim.lsp.config(server.name, configs[server.name] or {})
    vim.lsp.enable(server.name)
  else
    vim.notify("LSP binary not found: " .. server.binary, vim.log.levels.WARN)
  end
end
---
--- Mason Setup (For anything NOT handled by Nix yet)
---
require('mason').setup({})
require('mason-lspconfig').setup({
    -- We skip adding handlers that forcefully enable everything Mason installs,
    -- allowing our manual vim.lsp.enable() calls above to safely take priority.
    handlers = {
        function(server_name)
            -- Only enable via Mason if we haven't manually configured it above
            if server_name ~= "pyright" and server_name ~= "ruff" and server_name ~= "typos_lsp" then
                vim.lsp.enable(server_name)
            end
        end,
    }
})

-- Diagnostics
vim.diagnostic.config({
    virtual_text = false, 
})

-- Show all diagnostics on current line in floating window
vim.api.nvim_set_keymap(
    'n', '<Leader>ds', ':lua vim.diagnostic.open_float()<CR>',
    { noremap = true, silent = true }
)
-- Go to next diagnostic
vim.api.nvim_set_keymap(
    'n', '<Leader>dn', ':lua vim.diagnostic.goto_next()<CR>',
    { noremap = true, silent = true }
)
-- Go to prev diagnostic
vim.api.nvim_set_keymap(
    'n', '<Leader>dp', ':lua vim.diagnostic.goto_prev()<CR>',
    { noremap = true, silent = true }
)

-- CMP Config
local cmp = require('cmp')
cmp.setup({
    sources = {
        { name = 'nvim_lsp', keyword_length = 3 },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<S-TAB>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
        ['<TAB>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
        ['<C-p>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item({ behavior = 'insert' })
            else
                cmp.complete()
            end
        end),
        ['<C-n>'] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_next_item({ behavior = 'insert' })
            else
                cmp.complete()
            end
        end),
    },
})
