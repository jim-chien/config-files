return {
  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        opts = {},
      },
      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'enter',
        ['<CR>'] = { 'accept', 'select_and_accept', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'snippet_forward', 'fallback' },
        ['<C-p>'] = { 'snippet_backward', 'fallback' },
      },
      completion = {
        menu = {
          border = 'bold',
          draw = {
            columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind' } },
            padding = { 0, 1 }, -- padding only on right side
            components = {
              kind_icon = {
                text = function(ctx)
                  return ' ' .. ctx.kind_icon .. ctx.icon_gap .. ' '
                end,
              },
            },
          },
        },
        list = {
          selection = { preselect = true, auto_insert = true },
          max_items = 10,
        },
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
      },

      sources = {
        default = { 'lsp', 'buffer', 'path', 'snippets', 'lazydev' },
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
        },
      },

      snippets = { preset = 'luasnip' },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      signature = { enabled = true },
    },
  },
}
