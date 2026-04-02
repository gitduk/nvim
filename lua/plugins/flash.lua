return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  keys = {
    { 'f', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash Jump' },
    { 'F', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
    { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
    { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
  },
  opts = {
    modes = {
      -- Disable the default char-based f/F/t/T mode so our keymaps take over
      char = { enabled = false },
    },
  },
}
