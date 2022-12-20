local function map(m, k, v)
        vim.keymap.set(m, k, v, { silent = true })
end

local g = vim.g
local o = vim.o --vim.opt

o.timeoutlen = 500 -- decrease update time
o.updatetime = 200 -- decrease update time

o.scrolloff = 8 -- number of screen lines to keep above and below the cursor

-- better editor ui
o.number = true
o.numberwidth = 5
o.relativenumber = true
ncolumn = 'yes:2'
o.cursorline = true

-- better editing experience
o.expandtab = true
-- o.smarttab = true
o.cindent = true
-- o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 8
o.shiftwidth = 0
o.softtabstop = -1 -- if negative, shiftwidth value is used
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

o.clipboard = 'unnamedplus' -- neovim and os clipboard play nicely with each other

o.ignorecase = true -- case insensitive searching unless /c or capital in search
o.smartcase = true

o.backup = false -- undo and backup options 
o.writebackup = false 
o.undofile = true 
o.swapfile = false 
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

o.history = 50 -- remember 50 items in commandline history

-- better buffer splitting
o.splitright = true 
o.splitbelow = true

o.jumpoptions = 'view' -- preserve view while jumping

-- Map <leader> to space
g.mapleader = ' ' 
g.maplocalleader = ' '

-- switch into normal mod 
map('i', '<c-Space>', '<ESC>')
map('v', '<c-Space>', '<ESC>')

-- copy and past clipboard
map('v', '<C-c>', '"+y')    -- copy selected into desktop clipboard
map('n', '<C-p>', '"+p')    -- paste desktop clipboard into vim
map('x', "p","\"_dP")       -- replaced text without losing the paste
map('x', "<leader>p", 'p')  -- replaced text wit exchange the paste

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
map('i', '<C-k>', '<esc><cmd>m .-2<CR>==gi')
map('v', '<C-j>', ":m '>+1<CR>gv=gv")
map('v', '<C-k>', ":m '<-2<CR>gv=gv")
map("v", "<C-h>", "<gv", opts)
map("v", "<C-l>", ">gv", opts)
map("i", "<C-h>", "<C-d>", opts)
map("i", "<C-l>", "<C-t>", opts)

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
map('n', '<leader>e', ':Ex. <CR>') -- file explorer

-- ctrl s save file
map('i', '<c-s>', '<ESC>:w<CR>')
map('n', '<c-s>', ':w<CR>')


