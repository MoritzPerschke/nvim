-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`

local ts = require('nvim-treesitter')

ts.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
-- Install parsers
ts.install({ 'c', 'cpp', 'lua', 'python', 'rust', 'vimdoc', 'vim', 'bash', 'html', 'cmake', }):wait(300000)

-- Enable highlighting and indentation per filetype
vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('treesitter_setup', { clear = true }),
  pattern = '*',
  callback = function(ev)
    if ev.match == 'latex' then return end
    pcall(vim.treesitter.start, ev.buf)
    vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- Textobjects (select)
local select = require('nvim-treesitter-textobjects.select')
local keymaps = {
  ['aa'] = '@parameter.outer',
  ['ia'] = '@parameter.inner',
  ['af'] = '@function.outer',
  ['if'] = '@function.inner',
  ['ac'] = '@class.outer',
  ['ic'] = '@class.inner',
}
for key, obj in pairs(keymaps) do
  vim.keymap.set({ 'x', 'o' }, key, function()
    select.select_textobject(obj, 'textobjects')
  end)
end

-- Textobjects (move)
local move = require('nvim-treesitter-textobjects.move')
vim.keymap.set('n', ']m', function() move.goto_next_start('@function.outer', 'textobjects') end)
vim.keymap.set('n', ']]', function() move.goto_next_start('@class.outer', 'textobjects') end)
vim.keymap.set('n', ']M', function() move.goto_next_end('@function.outer', 'textobjects') end)
vim.keymap.set('n', '][', function() move.goto_next_end('@class.outer', 'textobjects') end)
vim.keymap.set('n', '[m', function() move.goto_previous_start('@function.outer', 'textobjects') end)
vim.keymap.set('n', '[[', function() move.goto_previous_start('@class.outer', 'textobjects') end)
vim.keymap.set('n', '[M', function() move.goto_previous_end('@function.outer', 'textobjects') end)
vim.keymap.set('n', '[]', function() move.goto_previous_end('@class.outer', 'textobjects') end)

-- Textobjects (swap)
local swap = require('nvim-treesitter-textobjects.swap')
vim.keymap.set('n', '<leader>a', function() swap.swap_next('@parameter.inner', 'textobjects') end)
vim.keymap.set('n', '<leader>A', function() swap.swap_previous('@parameter.inner', 'textobjects') end)

-- use html highlighting on stpl files
vim.cmd('autocmd BufRead,BufNewFile *.stpl set filetype=html')
-- vim: ts=2 sts=2 sw=2 et
