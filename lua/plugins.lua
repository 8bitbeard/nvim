vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
})

return packer.startup(function(use)

  -- Plugin Manager
  use 'wbthomason/packer.nvim'

  -- Configuration Plugins
  use 'nvim-lua/plenary.nvim'

  -- GUI Plugins
  use 'gruvbox-community/gruvbox'
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'machakann/vim-highlightedyank'

  -- Workflow Plugins
  use 'tpope/vim-commentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'jiangmiao/auto-pairs'
  use {'nvim-telescope/telescope.nvim', tag = '0.1.0' }
  use 'ThePrimeagen/harpoon'

  -- Completion Plugins
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'

  -- Snippets
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'

  -- LSP Plugins
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'RRethy/vim-illuminate'
  use 'mfussenegger/nvim-jdtls'
  -- use 'jose-elias-alvarez/null-ls.nvim'

  -- Testing Pluggins
  use 'janko-m/vim-test'

  -- Debugging Plugins
  -- use 'mfussenegger/nvim-dap'
  -- use 'rcarriga/nvim-dap-ui'

  -- Syntax Hilight
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
end)




