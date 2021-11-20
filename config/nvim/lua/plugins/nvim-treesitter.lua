-----------------------------------------------------------
-- Treesitter configuration file
-----------------------------------------------------------

-- Plugin: nvim-treesitter
-- https://github.com/nvim-treesitter/nvim-treesitter


require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
  indent = {
        enable = true,
   },
   ensure_installed = {
       "python",
       "comment",
       "bash",
       "bibtex",
       "c",
       "cpp",
       "dockerfile",
       "html",
       "json",
       "julia",
       "lua",
       "nix",
       "regex",
       "rust",
       "toml",
       "vim",
       "yaml",
   },
}
