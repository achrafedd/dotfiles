vim.g.mapleader = " "
vim.g.have_nerd_font = false

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = ""
opt.showmode = false
vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)
opt.breakindent = true
opt.undofile = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.list = false
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.inccommand = "split"
opt.cursorline = true
opt.scrolloff = 10
opt.winborder = "solid" -- https://neovim.io/doc/user/options.html#'winborder'
