-- require("thePrimeagen")
-- require("thePrimeagen")
-- print("hello World")

local function map(m, k, v)
        vim.keymap.set(m, k, v, { silent = true })
end

local g = vim.g
local o = vim.o --vim.opt

-- cmd('syntax on')
-- vim.api.nvim_command('filetype plugin indent on')

-- o.termguicolors = true
-- o.background = 'dark'

-- Do not save when switching buffers
-- o.hidden = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.numberwidth = 5
o.relativenumber = true
o.signcolumn = 'yes:2'
o.cursorline = true

-- Better editing experience
o.expandtab = true
-- o.smarttab = true
o.cindent = true
-- o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 8
o.shiftwidth = 0
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options 
o.backup = false 
o.writebackup = false 
o.undofile = true 
o.swapfile = false 
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Preserve view while jumping
o.jumpoptions = 'view'

-- BUG: this won't update the search count after pressing `n` or `N`
-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
-- o.lazyredraw = true

-- Better folds (don't fold by default)
-- o.foldmethod = 'indent'
-- o.foldlevelstart = 99
-- o.foldnestmax = 3
-- o.foldminlines = 1

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '

-- switch into normal mod 
map('i', '<c-Space>', '<ESC>')
map('v', '<c-Space>', '<ESC>')

-- copy and past clipboard
map('v', '<C-c>', '"+y')       -- copy selected into desktop clipboard
map('n', '<C-p>', '"+p')       -- paste desktop clipboard into vim
map('x', "<leader>p", "\"_dP") -- replaced text without losing the paste

-- Fix and keeping cursor in postion
map('n', 'n', 'nzzzv')       -- jump to next search dn
map('n', 'N', 'Nzzzv')       -- jump to next search up
map('n', '<c-u>', '<c-u>zz') -- half page up
map('n', '<c-d>', '<c-d>zz') -- half page dn
map('n', '<c-y>', '<c-e>j')  -- scroll one line page dn cursor up
map('n', '<c-e>', '<c-y>k')  -- scroll one line page dn cursor dn

-- Bubbling text
map('n', '<C-j>', '<cmd>m .+1<CR>==')
map('n', '<C-k>', '<cmd>m .-2<CR>==')
map('i', '<C-j>', '<esc><cmd>m .+1<CR>==gi')
map('i', '<C-k>', '<esc><cmd>m .g-2<CR>==gi')
map('v', '<C-j>', ":m '>+1<CR>gv=gv")
map('v', '<C-k>', ":m '<-2<CR>gv=gv")
map("v", "<C-h>", "<gv", opts)
map("v", "<C-l>", ">gv", opts)

-- Create breaks points for undo U
map('i', ',', ',<C-g>u') 
map('i', '.', '.<C-g>u') 
map('i', '!', '!<C-g>u') 
map('i', '?', '?<C-g>u') 

-- jump between split screen
map('i', '<A-l>', '<esc><C-w>l')
map('i', '<A-h>', '<esc><C-w>h')
map('i', '<A-j>', '<esc><C-w>j')
map('i', '<A-k>', '<esc><C-w>k')
map('n', '<A-l>', '<C-w>l')
map('n', '<A-h>', '<C-w>h')
map('n', '<A-j>', '<C-w>j')
map('n', '<A-k>', '<C-w>k')

-- source init.lua
map('n', '<leader>vv', '<cmd>luafile $MYVIMRC<CR>')
-- map('n', '<leader>g', '<cmd>vsplit ~/.config.nvmim/init.lua<CR>')
map('n', '<leader>e', ':Lex 30<CR>')

-- ctrl s save file
map('i', '<c-s>', '<ESC>:w<CR>')
map('n', '<c-s>', ':w<CR>')

require('packer-plugins')
vim.cmd[[colorscheme gruvbox]]
