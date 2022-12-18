return require('packer').startup(function()
	-- Packer can manage itself
        use 'wbthomason/packer.nvim'

        use {
                'nvim-telescope/telescope.nvim', tag = '0.1.0',
                -- or                            , branch = '0.1.x',
                requires = { {'nvim-lua/plenary.nvim'} }
        }

        -- colorscheme
	use "rafamadriz/gruvbox"
        use({
                'rose-pine/neovim',
                as = 'rose-pine',
                config = function()
                        vim.cmd('colorscheme rose-pine')
                end
        })

        use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
        use('nvim-treesitter/playground')
        use('theprimeagen/harpoon')
end)

