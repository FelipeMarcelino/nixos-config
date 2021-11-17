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
require("plugins.gitsigns")
require("plugins.vista")
require("plugins.indent-blanline")
