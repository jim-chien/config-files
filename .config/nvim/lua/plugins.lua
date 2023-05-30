local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd([[
  packadd packer.nvim
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Your plugins go here
  -- Appearance
  use 'vim-airline/vim-airline'
  use 'haya14busa/is.vim'
  use 'drewtempelmeyer/palenight.vim'
  use 'vim-airline/vim-airline-themes'
  use 'overcache/NeoSolarized'
  use 'tpope/vim-commentary'
  use { 'mg979/vim-visual-multi', branch = 'master' }
  -- Git
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'
end)
