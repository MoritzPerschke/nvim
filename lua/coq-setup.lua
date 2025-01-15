vim.o.completeopt = 'menuone,noinsert,preview'
vim.o.showmode = false

vim.g.coq_settings = {
  auto_start = 'shut-up',
  keymap = {
    recommended = true,
    pre_select = false, -- automatically select first entry in popup
  },
  display = {
    ghost_text = {
      enabled = true
    },
    statusline = {
      helo = false,
    },
  },
  match = {
    max_results = 7,
    fuzzy_cutoff = 0.7,
  },
  weights = {
    recency = 1.5
  }
}
vim.api.nvim_set_keymap('i', '<Space>', [[pumvisible() ? "\<C-y> " : "\<Space>"]], { expr = true, silent = true })
