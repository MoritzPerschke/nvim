local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set('n', '<leader>ha', function() harpoon:list():append() end, { desc = "Append current file to harpoon quick menu" })
vim.keymap.set('n', '<leader>hr', function() harpoon:list():remove() end, { desc = "Remove file from harpoon quick menu" })
vim.keymap.set('n', '<leader><Tab>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open harpoon quick menu" })

vim.keymap.set('n', 'H1', function() harpoon:list():select(1) end)
vim.keymap.set('n', 'H2', function() harpoon:list():select(2) end)
vim.keymap.set('n', 'H3', function() harpoon:list():select(3) end)
vim.keymap.set('n', 'H4', function() harpoon:list():select(4) end)

vim.keymap.set('n', '<Tab>', function() harpoon:list():next() end)
vim.keymap.set('n', '<S-Tab>', function() harpoon:list():prev() end)
