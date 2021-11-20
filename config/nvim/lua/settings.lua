-----------------------------------------------------------
-- Neovim settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases --------------------------------------------------------- local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd = vim.cmd -- execute Vim commands
local exec = vim.api.nvim_exec -- execute Vimscript
local fn = vim.fn -- call Vim functions
local g = vim.g -- global variables
local opt = vim.opt -- global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
g.mapleader = " " -- change leader to a space
opt.mouse = "a" -- enable mouse support
opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
opt.swapfile = false -- don't use swapfile
opt.writebackup = false -- don't write backup file
opt.updatetime = 300 -- Update time

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml setlocal cc=0]]

-- 2 spaces for selected filetypes
cmd [[
  autocmd FileType xml,html,xhtml,css,scss,yaml,nix,lua setlocal shiftwidth=2 tabstop=2 softtabstop=2
]]

cmd [[ au BufReadPost * if line("'\"") > 1 &&  line("'\"")  <= line("$") | exe "normal! g'\"" | endif ]]

cmd [[ au FocusLost * silent! :wa ]]

exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.lua,*.py,*.nix FormatWrite
augroup END
]], true)

-----------------------------------------------------------
-- Fold
-----------------------------------------------------------
opt.foldmethod = "syntax" -- enable folding (default 'foldmarker')
opt.foldlevelstart = 99
opt.foldnestmax = 10
opt.foldenable = false
opt.foldlevel = 1

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.number = true -- show line number
opt.relativenumber = true -- show line number
opt.colorcolumn = "100" -- line lenght marker at 100 columns
opt.splitright = true -- vertical split to the right
opt.splitbelow = true -- orizontal split to the bottom
opt.linebreak = true -- wrap on word boundary
opt.ruler = true -- Change window name
opt.textwidth = 100 -- Textwidth
opt.showmode = false -- Not showing mode
opt.cursorline = true -- A different color for cursor position
opt.signcolumn = "yes" -- Always show signcolumns
opt.showtabline = 2 -- Always tabline
opt.shortmess:append "sI" -- Disable nvim intro
opt.shortmess:append "c"
opt.inccommand = "nosplit" -- Show replacing live
opt.showbreak = "↪ "

-- remove whitespace on save
cmd [[au BufWritePre * :%s/\s\+$//e]]

-- highlight on yank
exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]],
  false
)

exec(
  [[
  augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
  augroup end
]],
  false
)

cmd [[au InsertEnter * setlocal nohlsearch]]

cmd [[
augroup numbertoggle
	autocmd!
	autocmd BufEnter, FocusGained, InsertLeave, WinEnter	* if &nu | set rnu	| endif
	autocmd BufLeave, FocusLost, InsertEnter, WinLeave	* if &nu | set nornu	| endif
augroup END
]]

-----------------------------------------------------------
-- Search
-----------------------------------------------------------
opt.showmatch = true -- highlight matching parenthesis
opt.ignorecase = true -- ignore case letters when search
opt.smartcase = true -- ignore lowercase for the whole pattern
opt.hlsearch = true
opt.incsearch = true
opt.gdefault = true

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- enable background buffers
opt.history = 100 -- remember n lines in history
opt.lazyredraw = true -- faster scrolling
opt.synmaxcol = 240 -- max column for syntax highlight
opt.autoread = true -- Autoread when file changes

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true -- enable 24-bit RGB colors
vim.o.background = "dark"
require("onedarkpro").load()

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.softtabstop = 4 -- Edit as if the tabs are 4 characters wide
opt.shiftround = true -- round indent to a multiple of 'shiftwidth'
opt.smartindent = true -- autoindent new lines
opt.smarttab = true -- autoindent new lines
opt.breakindent = true
opt.autoindent = true

-----------------------------------------------------------
-- Scroll
-----------------------------------------------------------
opt.startofline = false -- Jump to the first non blank character
opt.scrolloff = 8 -- Start scrollign when we are 8 lines away from margin
opt.sidescrolloff = 15
opt.sidescroll = 5

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
-- insert mode completion options
opt.completeopt = "menuone,noselect"

-- Wildmode
opt.wildmode = "list:full"
opt.wildignore = {
  ".o",
  ".obj",
  "*~",
  ".git",
  "cache",
  "logs",
  "node_modules",
  "log/**",
  ".png",
  ".jpg",
  ".git"
}

-----------------------------------------------------------
-- Vim-Doge
-----------------------------------------------------------
g.doge_doc_standard_python = "numpy"

-----------------------------------------------------------
-- Persistent undo
-----------------------------------------------------------
cmd [[
    if has("persistent_undo")
       let target_path = expand('~/.undodir')

        " create the directory and any parent directories
        " if the location does not exist.
        if !isdirectory(target_path)
            call mkdir(target_path, "p", 0700)
        endif

        let &undodir=target_path
        set undofile
    endif
]]
