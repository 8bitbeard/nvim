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
  use 'folke/tokyonight.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'akinsho/bufferline.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'machakann/vim-highlightedyank'
  use "lukas-reineke/indent-blankline.nvim"
  -- use 'ntpeters/vim-better-whitespace'
  -- use {
  -- "folke/which-key.nvim",
  -- config = function()
  --   vim.o.timeout = true
  --   vim.o.timeoutlen = 300
  --   require("which-key").setup {
  --     -- your configuration comes here
  --     -- or leave it empty to use the default settings
  --     -- refer to the configuration section below
  --   }
  -- end
  -- }
  --
  use 'rest-nvim/rest.nvim'

  -- Workflow Plugins
  -- use 'tpope/vim-commentary'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'jiangmiao/auto-pairs'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4'
  }
  use 'ThePrimeagen/harpoon'
  -- use 'github/copilot.vim'

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
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'nvimtools/none-ls.nvim'
  use 'folke/neodev.nvim'
  -- use 'williamboman/nvim-lsp-installer'
  -- use 'mfussenegger/nvim-jdtls'
  -- use 'jose-elias-alvarez/null-ls.nvim'
  -- use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

  -- Testing Plugins
  use 'janko-m/vim-test'

  -- Debugging Plugins
  -- use 'theHamsta/nvim-dap-virtual-text'
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use 'leoluz/nvim-dap-go'

  -- Terminal Plugins
  use {
    "akinsho/toggleterm.nvim",
    tag = 'v2.*'
  }

  -- Language grammar setup
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- Language specific Plugins
  -- use 'elixir-editors/vim-elixir'
  -- use 'simrat39/rust-tools.nvim'
end)
