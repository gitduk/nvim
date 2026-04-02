return {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>sR', function() require('spectre').open() end, desc = 'Search & Replace (Spectre)' },
    { '<leader>sW', function() require('spectre').open_visual({ select_word = true }) end, desc = 'Search current word (Spectre)' },
    { '<leader>sW', function() require('spectre').open_visual() end, mode = 'v', desc = 'Search selection (Spectre)' },
    { '<leader>sF', function() require('spectre').open_file_search({ select_word = true }) end, desc = 'Search in current file (Spectre)' },
  },
  opts = { open_cmd = 'noswapfile vnew' },
}
