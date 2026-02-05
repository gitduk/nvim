-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '<leader>e', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    close_if_last_window = true,
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
    sort_case_insensitive = true,

    event_handlers = {
      {
        event = 'file_opened',
        handler = function() require('neo-tree.command').execute { action = 'close' } end,
      },
    },

    default_component_configs = {
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
        indent_marker = '│',
        last_indent_marker = '└',
        with_expanders = true,
        expander_collapsed = '',
        expander_expanded = '',
      },
      modified = {
        symbol = '[+]',
        highlight = 'NeoTreeModified',
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
      },
      git_status = {
        symbols = {
          added = '✚',
          modified = '',
          deleted = '✖',
          renamed = '󰁕',
          untracked = '',
          ignored = '',
          unstaged = '󰄱',
          staged = '',
          conflict = '',
        },
      },
    },

    window = {
      position = 'left',
      width = 35,
      mappings = {
        ['<leader>e'] = 'close_window',
        ['l'] = 'open',
        ['h'] = 'close_node',
        ['<space>'] = 'none',
        ['e'] = function() vim.api.nvim_exec2('Neotree focus filesystem left', {}) end,
        ['b'] = function() vim.api.nvim_exec2('Neotree focus buffers left', {}) end,
        ['g'] = function() vim.api.nvim_exec2('Neotree focus git_status left', {}) end,
        ['s'] = 'open_split',
        ['v'] = 'open_vsplit',
        ['Y'] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg('+', vim.fn.fnamemodify(path, ':.'))
            vim.notify('Copied: ' .. vim.fn.fnamemodify(path, ':.'))
          end,
          desc = 'Copy relative path',
        },
      },
    },

    filesystem = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
      hijack_netrw_behavior = 'open_default',
      use_libuv_file_watcher = true,
      group_empty_dirs = true,
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          '.DS_Store',
          'thumbs.db',
        },
        never_show = {
          '.DS_Store',
          'thumbs.db',
          '.git',
        },
      },
    },

    buffers = {
      follow_current_file = {
        enabled = true,
        leave_dirs_open = true,
      },
    },

    git_status = {
      window = {
        position = 'float',
        mappings = {
          ['A'] = 'git_add_all',
          ['gu'] = 'git_unstage_file',
          ['ga'] = 'git_add_file',
          ['gr'] = 'git_revert_file',
        },
      },
    },
  },
}
