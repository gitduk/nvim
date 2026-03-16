-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter',
  opts = {
    ensure_installed = {
      'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline',
      'bash', 'python', 'javascript', 'typescript', 'json', 'yaml',
      'css', 'html', 'tsx', 'rust', 'toml'
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}

