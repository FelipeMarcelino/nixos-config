-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- https://github.com/lukas-reineke/indent-blankline.nvim

vim.opt.list = true
vim.opt.listchars:append("eol:↴")

require('indent_blankline').setup {
  show_trailing_blankline_indent = false,
  space_char_blankline = " ",
  show_current_context = true,
  context_patterns = {
    "def",
    "class",
    "return",
    "function",
    "method",
    "^if",
    "^while",
    "jsx_element",
    "^for",
  },
  filetype_exclude = {
    'help',
    'git',
    'markdown',
    'text',
    'terminal',
    'lspinfo',
    'packer'
  },
  buftype_exclude = {
    'terminal',
    'nofile'
  },
}
