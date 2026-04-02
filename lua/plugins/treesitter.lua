-- Highlight, edit, and navigate code
return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter',
  opts = {
    ensure_installed = {
      'lua', 'vim', 'vimdoc', 'markdown', 'markdown_inline',
      'bash', 'python', 'javascript', 'typescript', 'json', 'yaml',
      'css', 'html', 'tsx', 'rust', 'toml',
      'diff', -- Git diff view
      'ron',  -- Rust Object Notation (Bevy etc.)
      'sql',  -- SQL queries in Rust/Python projects
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}

