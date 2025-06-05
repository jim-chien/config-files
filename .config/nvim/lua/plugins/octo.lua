return {
  'pwntester/octo.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    vim.opt.fillchars:append 'diff:╱'
    vim.treesitter.language.register('markdown', 'octo')
  end,
  opts = {
    enable_builtin = true,
    default_to_projects_v2 = true,
    suppress_missing_scope = {
      projects_v2 = true,
    },
    picker = 'telescope',
    use_local_fs = true,
  },
}
