-- https://github.com/nvim-lua/kickstart.nvim

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
        is_bootstrap = true
        vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
        vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function()
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        use {
                'nvim-telescope/telescope.nvim', tag = '0.1.0',
                -- or                            , branch = '0.1.x',
                requires = { {'nvim-lua/plenary.nvim'} }
        }

        -- colorscheme
        use "rafamadriz/gruvbox"
        use "rose-pine/neovim"

        use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
        use('nvim-treesitter/playground')
        use('theprimeagen/harpoon')
        use('ThePrimeagen/vim-be-good')
        if is_bootstrap then
                require('packer').sync()
        end
end)

if is_bootstrap then
        print '=================================='
        print '    Plugins are being installed'
        print '    Wait until Packer completes,'
        print '       then restart nvim'
        print '=================================='
        return
end

require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = { "help", "javascript", "typescript", "python", "c", "lua", "rust" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
                -- `false` will disable the whole extension
                enable = true,


                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = false,
        },
}

function ColorMyPencils(color)
        color = color or 'gruvbox' 
        vim.cmd.colorscheme(color)
end
ColorMyPencils('gruvbox')

vim.opt.timeoutlen = 500 -- decrease update time
vim.opt.updatetime = 200 -- decrease update time

vim.opt.scrolloff = 8 -- number of screen lines to keep above and below the cursor

-- better editor ui
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.relativenumber = true
ncolumn = 'yes:2'
vim.opt.cursorline = true
vim.opt.colorcolumn = "80" -- marks column 80

vim.opt.expandtab = true
--- vim.opt.smarttab = true
vim.opt.cindent = true
--- vim.opt.autoindent = true
vim.opt.wrap = true
vim.opt.textwidth = 300
vim.opt.tabstop = 8
vim.opt.shiftwidth = 0
vim.opt.softtabstop = -1   -- if negative, shiftwidth value is used
vim.opt.list = true
vim.opt.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
vim.opt.laststatus = 3     -- thin line between splits instead a statusbar

vim.opt.clipboard = 'unnamedplus' -- neovim and os clipboard play nicely

vim.opt.ignorecase = true  -- case insensitive searching unless /c or capital in search
vim.opt.smartcase = true

vim.opt.backup = false     -- undo and backup options 
vim.opt.writebackup = false 
vim.opt.undofile = true 
vim.opt.swapfile = false 
--- vim.opt.backupdir = '/tmp/'
--- vim.opt.directory = '/tmp/'
--- vim.opt.undodir = '/tmp/'

vim.opt.history = 50       -- remember 50 items in commandline history

-- better buffer splitting
vim.opt.splitright = true 
vim.opt.splitbelow = true

vim.opt.jumpoptions = 'view' -- preserve view while jumping

-- Map <leader> to space
vim.g.mapleader = ' ' 
vim.g.maplocalleader = ' '

-- switch into normal mod 
vim.keymap.set('i', '<c-Space>', '<ESC>')
vim.keymap.set('v', '<c-Space>', '<ESC>')

-- Ctrl s save file
vim.keymap.set('n', '<c-s>', ':w<CR>')
vim.keymap.set('i', '<c-s>', '<ESC>:w<CR>')
vim.keymap.set('v', '<c-s>', '<ESC>:w<CR>')

-- source init.lua
vim.keymap.set('n', '<leader>vv', '<cmd>edit $MYVIMRC<CR>')

vim.keymap.set('n', '<leader>e', ':Ex. <CR>') -- file explorer

-- copy and past clipboard
-- vim.keymap.set('v', '<c-c>', '"+y')    -- copy selected into desktop clipboard
-- vim.keymap.set('n', '<c-c>', '"+y')    -- copy selected into desktop clipboard
-- vim.keymap.set('n', '<c-p>', '"+p')    -- paste desktop clipboard into vim
vim.keymap.set('x', "p","\"_dp")       -- replaced text without losing the paste
vim.keymap.set('x', "<leader>p", 'p')  -- replaced text wit exchange the paste

-- Fix and keeping cursor in postion
vim.keymap.set('n', 'n', 'nzzzv')       -- jump to next search dn
vim.keymap.set('n', 'N', 'Nzzzv')       -- jump to next search up
vim.keymap.set('n', '<c-u>', '<c-u>zz') -- half page up
vim.keymap.set('n', '<c-d>', '<c-d>zz') -- half page dn
vim.keymap.set('n', '<c-y>', '<c-e>j')  -- scroll one line page dn cursor up
vim.keymap.set('n', '<c-e>', '<c-y>k')  -- scroll one line page dn cursor dn
vim.keymap.set('n', 'J', 'mzJ`z')       -- join current and line below

-- Bubbling text up and down
vim.keymap.set('n', '<C-j>', '<cmd>m .+1<CR>==')         -- down
vim.keymap.set('n', '<C-k>', '<cmd>m .-2<CR>==')         -- up
vim.keymap.set('i', '<C-j>', '<esc><cmd>m .+1<CR>==gi')  -- down
vim.keymap.set('i', '<C-k>', '<esc><cmd>m .-2<CR>==gi')  -- up
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv")         -- down
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv")         -- up
-- Intending unintending text
vim.keymap.set("v", "<C-l>", ">gv", opts)         -- left
vim.keymap.set("v", "<C-h>", "<gv", opts)         -- right
vim.keymap.set("n", "<C-l>", "i<C-t><esc>", opts) -- left
vim.keymap.set("n", "<C-h>", "i<C-d><esc>", opts) -- right
vim.keymap.set("i", "<C-l>", "<C-t>", opts)       -- left
vim.keymap.set("i", "<C-h>", "<C-d>", opts)       -- right

-- Create breaks points for undo U
vim.keymap.set('i', ',', ',<C-g>u') 
vim.keymap.set('i', '.', '.<C-g>u') 
vim.keymap.set('i', '!', '!<C-g>u') 
vim.keymap.set('i', '?', '?<C-g>u') 

-- Jump between split screen
vim.keymap.set('i', '<A-h>', '<esc><C-w>h') -- right
vim.keymap.set('i', '<A-j>', '<esc><C-w>j') -- down
vim.keymap.set('i', '<A-k>', '<esc><C-w>k') -- up
vim.keymap.set('i', '<A-l>', '<esc><C-w>l') -- left
vim.keymap.set('n', '<A-h>', '<C-w>h')      -- right
vim.keymap.set('n', '<A-j>', '<C-w>j')      -- down
vim.keymap.set('n', '<A-k>', '<C-w>k')      -- up
vim.keymap.set('n', '<A-l>', '<C-w>l')      -- left
vim.keymap.set('v', '<A-h>', '<C-w>h')      -- right
vim.keymap.set('v', '<A-j>', '<C-w>j')      -- down
vim.keymap.set('v', '<A-k>', '<C-w>k')      -- up
vim.keymap.set('v', '<A-l>', '<C-w>l')      -- left

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set(
        'n', 
        '<leader>fs',
        function() builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set('n', '<leader>a', mark.add_file)
vim.keymap.set('n', '<leader>ee', ui.toggle_quick_menu)
vim.keymap.set('n', '<leader>1', function() ui.nav_file(1) end)
vim.keymap.set('n', '<leader>2', function() ui.nav_file(2) end)
vim.keymap.set('n', '<leader>3', function() ui.nav_file(3) end)
vim.keymap.set('n', '<leader>4', function() ui.nav_file(4) end)
vim.keymap.set('n', '<leader>5', function() ui.nav_file(5) end)
vim.keymap.set('n', '<leader>6', function() ui.nav_file(6) end)
vim.keymap.set('n', '<leader>7', function() ui.nav_file(7) end)
vim.keymap.set('n', '<leader>8', function() ui.nav_file(8) end)
vim.keymap.set('n', '<leader>9', function() ui.nav_file(9) end)

