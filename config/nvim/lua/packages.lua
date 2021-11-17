-- Plugin management
--------------------

-- Install packer if not already present
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

-- Run PackerCompile whenever this file is written
vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost packages.lua PackerCompile
  augroup end
]], false)

require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'                    -- packer can manage itself
    use 'lukas-reineke/indent-blankline.nvim'       -- indent blank lines
    use 'liuchengxu/vista.vim'                      -- Tagviewer
    use 'kyazdani42/nvim-web-devicons'              -- Icons
    use 'nvim-treesitter/nvim-treesitter'           -- Treesitter
    use 'neovim/nvim-lspconfig'                     -- LSP
    use 'williamboman/nvim-lsp-installer'           -- LSP Installer
    use "rafamadriz/friendly-snippets"              -- Snippets
    use "olimorris/onedarkpro.nvim"                 -- Colorscheme
    use {                                           -- Autocomplete
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
   }
   use {                                            -- Git labels
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end,
   }
end)

