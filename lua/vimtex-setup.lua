-- [[ Configure vimtex plugin ]]
-- :help vimtex

vim.g.vimtex_view_method = 'zathura'
-- create/use seperate dir for auxillary files
vim.g.vimtex_compiler_latexmk = {
  aux_dir = function() 
    return "." .. vim.fn.expand("%:t:r") .. "_aux" 
  end,
}

-- configure table of contents pane
vim.g.vimtex_toc_config = {
  split_pos = "vert rightbelow",
  split_width = 40,
  todo_sorted = 0,
  show_help = 0,
  layer_status = {
    content = 1,
    label = 1,
    todo = 1,
    include = 0,
  }
}

vim.g.vimtex_quickfix_ignore_filters = {
  'Underfull',
  'Missing "year"',
  'Missing "booktitle"',
  'Missing "journal"',
  'Marginpar on page',
}

vim.g.vimtex_quickfix_autoclose_after_keystrokes = 1
