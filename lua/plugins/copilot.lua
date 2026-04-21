return {
  {
    'zbirenbaum/copilot.lua',
    enabled = false,
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false }, -- Disable inline suggestions, use blink.cmp instead
      panel = { enabled = false },
    },
  },
  {
    'fang2hou/blink-copilot',
    enabled = false,
    dependencies = {
      'zbirenbaum/copilot.lua',
      'saghen/blink.cmp',
    },
  },
}
