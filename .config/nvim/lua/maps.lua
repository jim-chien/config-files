local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap('t', '<esc>', '<C-\\><C-N>', opts)

-- Prevent delete from overriding what's in the clipboard
keymap('n', 'd', '"_d', opts)
keymap('v', 'd', '"_d', opts)

-- Prevent x and the delete key from overriding what's in the clipboard.
keymap('n', 'x', '"_x', opts)
keymap('n', 'X', '"_x', opts)
keymap('n', '<Del>', '"_x', opts)
keymap('v', 'x', '"_x', opts)
keymap('v', 'X', '"_x', opts)
keymap('v', '<Del>', '"_x', opts)

-- Prevent pasting in visual from overriding what's in the clipboard
keymap('x', 'p', 'pgvy', opts)

keymap('n', 'wq', ':wq <CR>', opts)
keymap('n', '<leader>s', ':w<CR>', opts)
keymap('n', '<leader>w', ':w<CR>', opts)

-- Windows
keymap('n', 'sw', '<C-w>q', opts)

-- Split window
keymap('n', 'ss', ':split<Return><C-w>w', opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', opts)

-- Move window
keymap('n', '<Space>', '<C-w>w', opts)
keymap('n', 's<left>', '<C-w>h', term_opts)
keymap('n', 's<up>', '<C-w>k', term_opts)
keymap('n', 's<down>', '<C-w>j', term_opts)
keymap('n', 's<right>', '<C-w>l', term_opts)
keymap('n', 'sh', '<C-w>h', term_opts)
keymap('n', 'sk', '<C-w>k', term_opts)
keymap('n', 'sj', '<C-w>j', term_opts)
keymap('n', 'sl', '<C-w>l', term_opts)

-- Tab
keymap('n', '<leader>t', ':tabnew<CR>', opts)

-- Indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("n", "<", "<<", opts)
keymap("n", ">", ">>", opts)

-- Move visual block
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- Copy relative path of the current Buffer
keymap('n', '<leader>cp', ':let @*=expand("%")<CR>', opts)

-- Jump long lines with j and k
keymap('n', 'j', 'gj', opts)
keymap('n', 'k', 'gk', opts)

-- Search for selected text, forwards or backwards.
keymap('v', '*', [[:<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>]]
, { expr = true, noremap = true, silent = true })
keymap('v', '#', [[:<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>]],
  { expr = true, noremap = true, silent = true }
)
