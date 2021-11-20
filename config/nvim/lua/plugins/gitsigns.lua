-----------------------------------------------------------
-- Gitsigns configuration file
-----------------------------------------------------------

-- Plugin: gitsigns.nvim
-- https://github.com/lewis6991/gitsigns.nvim

require("gitsigns").setup {
  signs = {
    add = {hl = "GitSignsAdd", text = "┃", numhl = "", linehl = "GitSignsAddLn"},
    change = {hl = "GitSignsChange", text = "┃", numhl = "", linehl = "GitSignsChangeLn"},
    delete = {hl = "GitSignsDelete", text = "_", numhl = "", linehl = "GitSignsDeleteLn"},
    topdelete = {hl = "GitSignsDelete", text = "‾", numhl = "", linehl = "GitSignsDeleteLn"},
    changedelete = {hl = "GitSignsChange", text = "≃", numhl = "", linehl = "GitSignsChangeLn"}
  }
}
