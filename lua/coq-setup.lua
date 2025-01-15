vim.o.completeopt = 'menuone,noinsert,preview'
vim.o.showmode = false

vim.g.coq_settings = {
  auto_start = 'shut-up',
  keymap = {
    recommended = true,
    jump_to_mark = "<c-,>"
  },
  display = {
    ghost_text = {
      enabled = true
    }
  }
}

vim.api.nvim_set_keymap('i', '<Esc>', [[pumvisible() ? "<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
