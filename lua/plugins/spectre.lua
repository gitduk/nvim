return {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>rr', function() require('spectre').open() end,                                desc = 'Search & Replace (Spectre)' },
    { '<leader>rw', function() require('spectre').open_visual({ select_word = true }) end,   desc = 'Replace current word (Spectre)' },
    { '<leader>rw', function() require('spectre').open_visual() end, mode = 'v',             desc = 'Replace selection (Spectre)' },
    { '<leader>rf', function() require('spectre').open_file_search({ select_word = true }) end, desc = 'Replace in current file (Spectre)' },
  },
  opts = { open_cmd = 'noswapfile vnew' },
}
