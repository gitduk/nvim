return {
  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    opts = {
      suggestion = { enabled = false }, -- Disable inline suggestions, use blink.cmp instead
      panel = { enabled = false },
    },
  },
  {
    'fang2hou/blink-copilot',
    dependencies = {
      'zbirenbaum/copilot.lua',
      'saghen/blink.cmp',
    },
  },
}
