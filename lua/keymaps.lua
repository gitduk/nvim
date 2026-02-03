-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = vim.diagnostic.severity.ERROR },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Teest shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },
}

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map('i', 'jk', '<ESC>')

-- buffer
map('n', 'L', ':bn<cr>', { desc = 'Next buffer' })
map('n', 'H', ':bp<cr>', { desc = 'Prev buffer' })

map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- move lines
map('n', '<S-j>', '<cmd>m .1<cr>==', { desc = 'Move down' })
map('n', '<S-k>', '<cmd>m .-2<cr>==', { desc = 'Move up' })
map('v', '<S-j>', ":m '>+1<cr>gv=gv", { desc = 'Move down' })
map('v', '<S-k>', ":m '<-2<cr>gv=gv", { desc = 'Move up' })
-- map("i", "<S-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<S-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })

--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- quick delete
map('i', '<C-h>', '<BS>', { desc = 'Backspace' })
map('i', '<C-l>', '<DEL>', { desc = 'Delete' })

-- redo
map('n', 'U', ':redo<cr>', { desc = 'Redo' })

-- clear search with <esc>
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')
map('v', 'H', '<gv')
map('v', 'L', '>gv')
map('v', 'q', '<esc>')

-- copy
map('v', 'Y', '"+yy', { desc = 'Copy to system clipboard' })

-- quick header
map('n', '<leader>k', function()
  local line = vim.fn.getline '.'
  local cs = vim.bo.commentstring or '# %s'
  local comment_sym = vim.trim(cs:match '^(.-)%%s' or '#')

  local pad = ' '
  local side = comment_sym:rep(3) -- 三个注释符用于中间行包裹
  local middle_content = side .. pad .. line .. pad .. side

  -- 为了让边框长度与中间行一致，我们使用字符宽度计算而不是注释符重复次数
  local total_width = vim.fn.strdisplaywidth(middle_content)
  local border_unit = comment_sym:sub(1, 1) -- 只用单个字符来画边框（美观）
  local border_line = border_unit:rep(total_width)

  local lnum = vim.fn.line '.'
  vim.fn.setline(lnum, border_line)
  vim.fn.append(lnum, middle_content)
  vim.fn.append(lnum + 1, border_line)

  -- 可选：是否调用注释命令
  -- vim.cmd(lnum .. "," .. (lnum + 2) .. "normal gcc")
end, { desc = 'boxed comment header' })
