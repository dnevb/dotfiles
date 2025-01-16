vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.colorscheme = 'oxocarbon'
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.big_file = { size = 1024 * 100, lines = 10000 }
vim.g.is_windows = vim.fn.has('win32') == 1

if vim.g.is_windows then
	vim.opt.shell = "C:/Program Files/Git/bin/bash.exe"
	vim.opt.shellcmdflag = '-s'
end

vim.opt.linebreak = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.showtabline = 2
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.fileencoding = "utf-8"
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.number = true
vim.opt.relativenumber = true
