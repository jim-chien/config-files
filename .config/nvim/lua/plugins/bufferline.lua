return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    dependencies = { 'nvim-tree/nvim-web-devicons', 'folke/snacks.nvim' },
    opts = {},
    keys = {
      { '<leader>c', '<cmd>lua Snacks.bufdelete()<cr>', desc = 'Delete current buffer' },
      { '<leader>bn', '<cmd>BufferLineCycleNext<cr>', desc = 'Go to next buffer' },
      { '<leader>bp', '<cmd>BufferLineCyclePrev<cr>', desc = 'Go to previous buffer' },
    },
  },
}
