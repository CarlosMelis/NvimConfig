-- For conciseness
local opt = vim.opt

-- Line numbers
opt.relativenumber = true
opt.number = true

-- Tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.showtabline = 2

-- Line wrapping 
opt.wrap = false

-- Cursor line
opt.cursorline = true

-- Search settings
opt.ignorecase = true
opt.smartcase = true

-- Appearance 
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- Backspace
opt.backspace = "indent,eol,start"

-- Clipboard
opt.clipboard:append("unnamedplus")

-- Split windows 
opt.splitright = true
opt.splitbelow = true

-- Consider "-" character part of words
opt.iskeyword:append("-")



