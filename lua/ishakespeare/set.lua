vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.guifont = {"CodeNewRoman Nerd Font", ":h16"}

if vim.g.neovide then
  vim.o.guifont = "CodeNewRoman Nerd Font:h12"
end

vim.opt.nu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
