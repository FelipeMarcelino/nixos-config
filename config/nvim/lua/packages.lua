--------------------
-- Plugin management
--------------------

-- Install packer if not already present
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

-- Run PackerCompile whenever this file is written
vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost packages.lua PackerCompile
  augroup end
]],
  false
)

require("packer").startup(
  function(use)
    use "wbthomason/packer.nvim" -- packer can manage itself
    use "nvim-lua/popup.nvim" -- Base
    use "lukas-reineke/indent-blankline.nvim" -- indent blank lines
    use "liuchengxu/vista.vim" -- Tagviewer
    use "kyazdani42/nvim-web-devicons" -- Icons
    use "nvim-treesitter/nvim-treesitter" -- Treesitter
    use "neovim/nvim-lspconfig" -- LSP
    use "williamboman/nvim-lsp-installer" -- LSP Installer
    use "rafamadriz/friendly-snippets" -- Snippets
    use "olimorris/onedarkpro.nvim" -- Colorscheme
    use {
      -- Autocomplete
      "hrsh7th/nvim-cmp",
      requires = {
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip"
      }
    }
    use {
      -- Git labels
      "lewis6991/gitsigns.nvim",
      requires = {"nvim-lua/plenary.nvim"}
    }
    use "ray-x/lsp_signature.nvim"
    use {
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons"
    }
    use "windwp/nvim-autopairs"
    -- Lua
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {}
      end
    }
    use "tpope/vim-commentary"
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    -- use "christoomey/vim-tmux-navigator"
    use "wellle/targets.vim"
    use "junegunn/goyo.vim"
    use "junegunn/fzf"
    use {
      -- Colorizer
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end
    }
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {}
      end
    }
    use "ggandor/lightspeed.nvim"
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/plenary.nvim"}}
    }
    use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
    use {
      "romgrk/barbar.nvim",
      requires = {"kyazdani42/nvim-web-devicons"}
    }
    use {"kkoomen/vim-doge", run = ":call doge#install()"}
    use "kosayoda/nvim-lightbulb"
    use "mbbill/undotree"
    use {
      "nvim-lualine/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }
    use "mhartington/formatter.nvim"
    use "mfussenegger/nvim-dap"
    use {
      "rcarriga/nvim-dap-ui",
      requires = {"mfussenegger/nvim-dap"}
    }
    use "theHamsta/nvim-dap-virtual-text"
    use {
      "mfussenegger/nvim-dap-python",
      config = function()
        require("dap-python").setup("python")
      end
    }
    use "nvim-telescope/telescope-dap.nvim"
  end
)
