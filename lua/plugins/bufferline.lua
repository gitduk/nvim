return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  opts = {
    options = {
      diagnostics = 'nvim_lsp',
      offsets = {
        {
          filetype = 'snacks_explorer',
          text = 'File Explorer',
          highlight = 'Directory',
          separator = true,
        },
      },
      show_buffer_close_icons = false,
      show_close_icon = false,
      separator_style = 'thin',
    },
  },
}
