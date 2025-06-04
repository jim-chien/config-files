return {
  root_markers = { 'tsconfig.base.json', 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
  root_dir = function(bufnr, cb)
    local fname = vim.uri_to_fname(vim.uri_from_bufnr(bufnr))

    local ts_root = vim.fs.find('tsconfig.json', { upward = true, path = fname })[1]
    -- Use the git root to deal with monorepos where TypeScript is installed in the root node_modules folder.
    local git_root = vim.fs.find('.git', { upward = true, path = fname })[1]

    if git_root then
      cb(vim.fn.fnamemodify(git_root, ':h'))
    elseif ts_root then
      cb(vim.fn.fnamemodify(ts_root, ':h'))
    end
  end,
  settings = {
    typescript = {
      tsserver = {
        maxTsServerMemory = 4096,
      },
    },
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = '@styled/typescript-styled-plugin',
            location = '/Users/jimchien/.asdf/installs/nodejs/22.14.0/.npm/lib',
            enableForWorkspaceTypeScriptVersions = true,
          },
        },
      },
      -- Automatically use workspace version of TypeScript lib on startup.
      autoUseWorkspaceTsdk = true,
      enableMoveToFileCodeAction = true,
      experimental = {
        -- For completion performance.
        completion = {
          enableServerSideFuzzyMatch = true,
          entriesLimit = 20,
        },
      },
    },
  },
}
