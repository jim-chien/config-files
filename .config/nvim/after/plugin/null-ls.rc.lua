local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.zsh,
    null_ls.builtins.diagnostics.eslint_d,
  },
})
