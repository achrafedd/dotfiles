local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"

-- Tabs & Indentation (Devaslife standard: 2 spaces)
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Display & UI
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.wrap = true
opt.breakindent = true
opt.showmode = false
opt.laststatus = 3 -- Global statusline
opt.title = true
opt.inccommand = "split"

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Backup & Undo
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Smooth scrolling / responsiveness
opt.updatetime = 250
opt.timeoutlen = 300
opt.clipboard = "unnamedplus"

-- Undercurl support
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:-3m"]])
