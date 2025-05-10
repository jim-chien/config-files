return {
  root_markers = { 'tsconfig.base.json', 'tsconfig.json', 'package.json', '.git' },
  settings = {
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
