local function has_eslint_config(utils)
  return utils.root_has_file {
    '.eslintrc',
    '.eslintrc.cjs',
    '.eslintrc.js',
    '.eslintrc.json',
    'eslint.config.cjs',
    'eslint.config.js',
    'eslint.config.mjs',
  }
end

return {
  'nvimtools/none-ls.nvim',
  -- Copied from LazyVim/lua/lazyvim/util/plugin.lua
  event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
  enabled = false,
  dependencies = {
    'mason.nvim',
    'nvimtools/none-ls-extras.nvim',
    'nvim-lua/plenary.nvim',
  },
  opts = function()
    local nls = require 'null-ls'
    vim.env.ESLINT_D_PPID = vim.fn.getpid()

    return {
      root_dir = require('null-ls.utils').root_pattern('.null-ls-root', '.neoconf.json', 'Makefile', '.git'),
      sources = {
        nls.builtins.formatting.prettierd.with {
          disabled_filetypes = { 'yaml' },
          prefer_local = 'node_modules/.bin',
        },
        nls.builtins.formatting.stylua,
        -- require('none-ls.diagnostics.eslint_d').with {
        --   condition = has_eslint_config,
        --   filetypes = {
        --     'javascript',
        --     'javascriptreact',
        --     'typescript',
        --     'typescriptreact',
        --     'vue',
        --     'svelte',
        --     'astro',
        --     'html',
        --   },
        -- },
        -- require('none-ls.code_actions.eslint_d').with {
        --   condition = has_eslint_config,
        --   filetypes = {
        --     'javascript',
        --     'javascriptreact',
        --     'typescript',
        --     'typescriptreact',
        --     'vue',
        --     'svelte',
        --     'astro',
        --     'html',
        --   },
        -- },
      },
    }
  end,
}
