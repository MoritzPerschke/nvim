---@diagnostic disable: missing-fields

local lir = require'lir'
local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require'lir'.setup {
  show_hidden_files = false,
  ignore = {}, -- { ".DS_Store", "node_modules" } etc.
  devicons = {
    enable = true,
    highlight_dirname = true
  },
  mappings = {
    ['l']     = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,
    ['<C-t>'] = actions.tabedit,

    ['h']     = actions.up,
    ['q']     = actions.quit,

    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['@']     = actions.cd,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,

    ['J'] = function()
      mark_actions.toggle_mark('n')
      vim.cmd('normal! j')
    end,
    ['C'] = clipboard_actions.copy,
    ['X'] = clipboard_actions.cut,
    ['P'] = clipboard_actions.paste,

    ['O'] = function()
      local current = lir.get_context():current()
      local extension = string.match(current.value, '[^.]+$')
      if extension == 'pdf' then
        vim.fn.system('xdg-open ' .. current.fullpath)
        return
      elseif extension == 'png' or extension == 'jpg' then
        vim.fn.system('xdg-open ' .. current.fullpath)
      end
    end
  },
  float = {
    winblend = 0,
    curdir_window = {
      enable = true,
      highlight_dirname = true
    },

    -- -- -- You can define a function that returns a table to be passed as the third
    -- -- -- argument of nvim_open_win().
    -- win_opts = function()
    --   local width = math.floor(vim.o.columns * 0.5)
    --   local height = math.floor(vim.o.lines * 0.5)
    --   return {
    --     border = {
    --       "+", "=", "+", "│", "+", "=", "+", "│",
    --     },
    --     width = width,
    --     height = height,
    --     row = math.floor((vim.o.lines - height) / 2),
    --     col = math.floor((vim.o.columns - width) / 2),
    --   }
    -- end,

  },
  hide_cursor = true
}

vim.api.nvim_create_autocmd({'FileType'}, {
  pattern = {"lir"},
  callback = function()
    -- use visual mode
    vim.api.nvim_buf_set_keymap(
      0,
      "x",
      "J",
      ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
      { noremap = true, silent = true }
    )
  
    -- echo cwd
    vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
  end
})

-- custom folder icon
require'nvim-web-devicons'.set_icon({
  lir_folder_icon = {
    icon = "",
    color = "#7ebae4",
    name = "LirFolderNode"
  }
})

function _G._LirSetTextFloatCurdirWindow()
  if vim.w.lir_is_float then
    local lir_config = require('lir.config')
    local bufnr = vim.w.lir_curdir_win.bufnr
    if lir_config.values.show_hidden_files then
      vim.api.nvim_buf_set_extmark(bufnr, 1, 0, 1, {
        end_col = 2,
        -- Icons and marks can be freely changed.
        virt_text = { { "o", "WarningMsg" } },
      })
    else
      vim.api.nvim_buf_set_extmark(bufnr, 1, 0, 1, {
        end_col = 2,
        -- Icons and marks can be freely changed.
        virt_text = { { "x", "Comment" } },
      })
    end
  end
end

vim.api.nvim_exec2([[
augroup my-lir
  autocmd!
  autocmd User LirSetTextFloatCurdirWindow lua _LirSetTextFloatCurdirWindow()
augroup END
]], {})
