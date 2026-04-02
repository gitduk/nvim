return {
  {
    -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter',
    opts = {
      -- delay between pressing a key and opening which-key (milliseconds)
      delay = 0,
      icons = { mappings = vim.g.have_nerd_font },

      -- Document existing key chains
      spec = {
        { '<leader>s', group = '[S]earch',      mode = { 'n', 'v' } },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>u', group = '[U]I Toggles' },
        { '<leader>g', group = '[G]it' },
        { '<leader>h', group = 'Git [H]unk',    mode = { 'n', 'v' } },
        { '<leader>x', group = 'Trouble/[X]' },
        { '<leader>b', group = '[B]reakpoint' },
        { '<leader>c', group = '[C]ode' },
        { '<leader>r', group = '[R]eplace' },
        { '<leader>d', group = '[D]ebug' },
      },
    },
  },
}
