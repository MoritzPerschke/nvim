local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set('n', '<leader>pa', function() harpoon:list():add() end, { desc = "Append current file to harpoon quick menu" })
vim.keymap.set('n', '<leader>pr', function() harpoon:list():remove() end, { desc = "Remove file from harpoon quick menu" })
vim.keymap.set('n', '<leader><Tab>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open harpoon quick menu" })

vim.keymap.set('n', '<leader>1', function() harpoon:list():select(1) end, {desc = "File 1 in Harpoon list"})
vim.keymap.set('n', '<leader>2', function() harpoon:list():select(2) end, {desc = "File 2 in Harpoon list"})
vim.keymap.set('n', '<leader>3', function() harpoon:list():select(3) end, {desc = "File 3 in Harpoon list"})
vim.keymap.set('n', '<leader>4', function() harpoon:list():select(4) end, {desc = "File 4 in Harpoon list"})

vim.keymap.set('n', '<Tab>', function() harpoon:list():next() end)
vim.keymap.set('n', '<S-Tab>', function() harpoon:list():prev() end)
