return {
  {
    -- Enhanced Rust development experience
    'mrcjkb/rustaceanvim',
    version = '^6',
    ft = { 'rust' },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          on_attach = function(_, bufnr)
            -- Enable inlay hints for Rust buffers
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

            local map = function(keys, func, desc)
              vim.keymap.set('n', keys, func, { buffer = bufnr, desc = 'Rust: ' .. desc })
            end
            map('<leader>ca', function() vim.cmd.RustLsp('codeAction') end, 'Code Action')
            map('K',          function() vim.cmd.RustLsp({ 'hover', 'actions' }) end, 'Hover Actions')
            map('<leader>dr', function() vim.cmd.RustLsp('debuggables') end, 'Debuggables')
            map('<leader>dt', function() vim.cmd.RustLsp('testables') end, 'Testables')
            map('<leader>de', function() vim.cmd.RustLsp('explainError') end, 'Explain Error')
            map('<leader>dm', function() vim.cmd.RustLsp('expandMacro') end, 'Expand Macro')
          end,
          settings = {
            ['rust-analyzer'] = {
              -- Use clippy instead of check for richer lint feedback
              check = { command = 'clippy', extraArgs = { '--', '-W', 'clippy::all' } },
              inlayHints = {
                bindingModeHints = { enable = true },
                chainingHints = { enable = true },
                closingBraceHints = { enable = true },
                lifetimeElisionHints = { enable = 'always' },
                typeHints = { enable = true },
              },
            },
          },
        },
      }
    end,
  },

  {
    -- Show crate versions and features in Cargo.toml
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    opts = {
      completion = {
        crates = { enabled = true },
      },
      lsp = {
        enabled = true,
        actions = true,
        completion = true,
        hover = true,
      },
    },
  },
}
