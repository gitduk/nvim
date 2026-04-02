return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,
  keys = {
    { '-', '<cmd>Oil<cr>', desc = 'Open parent directory (Oil)' },
  },
  opts = {
    -- Show hidden files by default
    view_options = {
      show_hidden = true,
    },
    -- Keymaps inside oil buffer
    keymaps = {
      ['<CR>'] = 'actions.select',
      ['-'] = 'actions.parent',
      ['_'] = 'actions.open_cwd',
      ['gs'] = 'actions.change_sort',
      ['gx'] = 'actions.open_external',
      ['g.'] = 'actions.toggle_hidden',
      ['g?'] = 'actions.show_help',
    },
  },
}
