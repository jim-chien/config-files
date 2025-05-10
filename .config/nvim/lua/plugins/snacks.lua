return {
  'folke/snacks.nvim',
  lazy = false,
  keys = {
    { '<leader>;', '<cmd>lua Snacks.dashboard()<cr>', desc = 'Open Snacks Dashboard' },
  },
  opts = {
    dashboard = {
      enabled = true,
      sections = {
        { section = 'header' },
        { section = 'keys', gap = 1, padding = { 1, 0 } },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = { 1, 0 } },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },
    input = {},
    styles = {
      input = {
        relative = 'cursor',
        row = -3,
        col = 0,
      },
    },
  },
}
