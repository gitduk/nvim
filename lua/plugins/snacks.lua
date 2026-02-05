return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      picker = { enabled = true },
      explorer = { enabled = true },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      styles = {
        notification = {
          -- wo = { wrap = true } -- Wrap notifications
        },
      },
    },
    keys = {
      -- Top Pickers
      { '<leader><leader>', function() Snacks.picker.buffers() end, desc = 'Buffers' },
      { '<leader>/', function() Snacks.picker.grep_curr_buf() end, desc = 'Grep (Current Buffer)' },
      { '<leader>sf', function() Snacks.picker.files() end, desc = 'Find Files' },
      { '<leader>sg', function() Snacks.picker.grep() end, desc = 'Grep' },
      { '<leader>s.', function() Snacks.picker.recent() end, desc = 'Recent' },
      -- Search
      { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = 'Diagnostics' },
      { '<leader>sh', function() Snacks.picker.help() end, desc = 'Help Tags' },
      { '<leader>sk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },
      { '<leader>ss', function() Snacks.picker.smart() end, desc = 'Smart Find' },
      { '<leader>sw', function() Snacks.picker.grep_word() end, desc = 'Visual selection or word', mode = { 'n', 'x' } },
      { '<leader>sc', function() Snacks.picker.commands() end, desc = 'Commands' },
      { '<leader>sr', function() Snacks.picker.resume() end, desc = 'Resume' },
      -- LSP
      { 'grd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto Definition' },
      { 'grr', function() Snacks.picker.lsp_references() end, nowait = true, desc = 'References' },
      { 'gri', function() Snacks.picker.lsp_implementations() end, desc = 'Goto Implementation' },
      { 'grt', function() Snacks.picker.lsp_type_definitions() end, desc = 'Goto Type Definition' },
      { 'gO', function() Snacks.picker.lsp_symbols() end, desc = 'Document Symbols' },
      { 'gW', function() Snacks.picker.lsp_workspace_symbols() end, desc = 'Workspace Symbols' },
      -- Other
      { '<leader>e', function() Snacks.explorer() end, desc = 'File Explorer' },
      { '<leader>z', function() Snacks.zen() end, desc = 'Toggle Zen Mode' },
      { '<leader>Z', function() Snacks.zen.zoom() end, desc = 'Toggle Zoom' },
      { '<leader>.', function() Snacks.scratch() end, desc = 'Toggle Scratch Buffer' },
      { '<leader>S', function() Snacks.scratch.select() end, desc = 'Select Scratch Buffer' },
      { '<leader>n', function() Snacks.notifier.show_history() end, desc = 'Notification History' },
      { '<leader>bd', function() Snacks.bufdelete() end, desc = 'Delete Buffer' },
      { '<leader>cR', function() Snacks.rename.rename_file() end, desc = 'Rename File' },
      { '<leader>gB', function() Snacks.gitbrowse() end, desc = 'Git Browse' },
      { '<leader>gb', function() Snacks.git.blame_line() end, desc = 'Git Blame Line' },
      { '<leader>gg', function() Snacks.lazygit() end, desc = 'Lazygit' },
      { '<leader>un', function() Snacks.notifier.hide() end, desc = 'Dismiss All Notifications' },
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          -- Setup some globals for debugging (optional)
          _G.Snacks = Snacks
          -- Create some toggle mappings
          Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
          Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
          Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>ur'
          Snacks.toggle.diagnostics():map '<leader>ud'
          Snacks.toggle.line_number():map '<leader>ul'
          Snacks.toggle.option('conceallevel', { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map '<leader>uc'
          Snacks.toggle.treesitter():map '<leader>uT'
          Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>ub'
          Snacks.toggle.inlay_hints():map '<leader>uh'
          Snacks.toggle.indent():map '<leader>ug'
          Snacks.toggle.dim():map '<leader>uD'
        end,
      })
    end,
  },
}

