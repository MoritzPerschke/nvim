-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default and relative
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- configure autoindent
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.smartindent = true

-- enable ctrl backspace to delete word in insert mode
vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', {noremap = true})

local opts = { noremap=true, silent=true }

local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end
vim.keymap.set('n', '<leader>qf', quickfix, opts)

vim.keymap.set('n', '<leader>zf', 'zf]M', {desc = 'Create fold from cursor to end of next function'})

-- Highlight current cursor position
vim.cmd('hi clear CursorLine')
vim.cmd('hi CursorLine gui=underline cterm=underline')
vim.cmd('set cursorline')

vim.opt.wildignore:append({
  "blue.vim",
  "darkblue.vim",
  "delek.vim",
  "desert.vim",
  "elflord.vim",
  "evening.vim",
  "industry.vim",
  "habamax.vim",
  "koehler.vim",
  "lunaperche.vim",
  "morning.vim",
  "murphy.vim",
  "pablo.vim",
  "peachpuff.vim",
  "quiet.vim",
  "ron.vim",
  "shine.vim",
  "slate.vim",
  "sorbet.vim",
  "retrobox.vim",
  "torte.vim",
  "wildcharm.vim",
  "zaibatsu.vim",
  "zellner.vim",
})

-- set color scheme
vim.cmd('colorscheme gruvbox')

-- vim: ts=2 sts=2 sw=2 et
