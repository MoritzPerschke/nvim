-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- vim: ts=2 sts=2 sw=2 et
--
-- Jump to previous buffer
vim .keymap.set('n', '<BS>', '<c-^>', { desc = 'Go back to previous buffer' })

-- Quick function to toggle nvim tree
-- vim.g.show_tree = false
-- function _G.toggle_nvim_tree()
--   if vim.g.show_tree == true then
--     vim.g.show_tree = false
--     vim.cmd "NvimTreeOpen"
--   else
--     vim.g.show_tree = true
--     vim.cmd "NvimTreeClose"
--   end
-- end
vim.keymap.set('n', '<leader>f', ":lua require('lir.float').toggle()<CR>", { desc = '[F]ile explorer float' })

-- Exit terminal mode using <Esc>
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal insert mode' })

-- [[ Keymaps to work with tabs ]]
-- use <leader>tn to go to next tab
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', { desc = 'Switch to next tab' })

-- use <leader>tp to go to previous tab
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', { desc = 'Switch to previous tab' })

-- use <leader>ta to append a new tab
vim.keymap.set('n', '<leader>ta', ':tabnew<CR>', { desc = 'Append new Tab'})
