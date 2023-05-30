vim.cmd("autocmd!")

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.background= 'dark'
vim.g.mapleader = ';'
vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.termguicolors = true
vim.opt.completeopt = { 'noinsert', 'menuone', 'noselect' }
vim.opt.foldmethod = 'manual'
vim.opt.cursorline = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.title = true
vim.opt.wildmenu = true
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.incsearch = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.ttyfast = true
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")
vim.opt.list = true
vim.cmd [[set listchars=tab:›\ ,space:·]]
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildmode = { 'list:longest', 'list:full' }
vim.opt.wildignore:append { '*/node_modules/*', '*coverage/', '*.o', '*.obj', '.git', '*.rbc', '*.pyc', '__pycache__', '*/tmp/*', '*.so', '*.swp', '*.zip', '*.db', '*.sqlite', '.DS_Store' }
vim.cmd[[colorscheme palenight]]

-- Use terminal background
vim.cmd('highlight Normal guibg=none guifg=none')

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
