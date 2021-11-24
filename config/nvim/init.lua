--[[
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
Neovim init file
Maintainer: FelipeMarcelino
Website: https://github.com/FelipeMarcelino/nixos-config
--]]
--

-----------------------------------------------------------
-- Import Lua modules
-----------------------------------------------------------
require("settings")
require("keymaps")
require("packages")
require("plugins.nvim-treesitter")
require("plugins.nvim-lspconfig")
require("plugins.nvim-cmp")
require("plugins.lua-lspconfig")
require("plugins.luasnip")
require("plugins.vista")
require("plugins.indent-blanline")
require("plugins.nvim-tree")
require("plugins.nvim-autopairs")
require("plugins.telescope")
require("plugins.tree")
require("plugins.lightbulb")
require("plugins.lualine")
require("plugins.formatter")
require("plugins.gitsigns")
require("plugins.dapvirtual")
require("plugins.dapui")
