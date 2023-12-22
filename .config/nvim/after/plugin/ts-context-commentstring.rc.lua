local status, ts = pcall(require, "ts_context_commentstring")
if (not status) then return end

ts.setup {
  enable_autocmd = false,
  languages = {
    typescript = '// %s',
  },
}
