-----------------------------------------------------------
-- Keymaps configuration file: keymaps of neovim
-- and plugins.
-----------------------------------------------------------

local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}
local cmd = vim.cmd

-----------------------------------------------------------
-- Neovim shortcuts:
-----------------------------------------------------------

-- clear search highlighting
map("n", "<leader>c", ":nohl<CR>", default_opts)

-- map Esc to jj
map("i", "jj", "<Esc>", {noremap = true})

-- don't use arrow keys
map("", "<up>", "<nop>", {noremap = true})
map("", "<down>", "<nop>", {noremap = true})
map("", "<left>", "<nop>", {noremap = true})
map("", "<right>", "<nop>", {noremap = true})

-- fast saving with <leader> and s
map("n", "<C-s>", ":w<CR>", default_opts)

-- move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h", default_opts)
map("n", "<C-j>", "<C-w>j", default_opts)
map("n", "<C-k>", "<C-w>k", default_opts)
map("n", "<C-l>", "<C-w>l", default_opts)

-- close all windows and exit from neovim
map("n", "<leader>qq", ":qa!<CR>", default_opts)

-- Down is really the next line
map("n", "j", "gj", default_opts)
map("n", "k", "gk", default_opts)

-- Move to end of the yanked text after yank and paste
map("n", "p", "p`]", default_opts)
map("v", "y", "y`]", default_opts)
map("v", "p", "py`]", default_opts)

-- Move selected lines up and down
map("v", "J", ":m '>+1<CR>gv=gv", default_opts)
map("v", "K", ":m '<-2<CR>gv=gv", default_opts)

-- Toggle between last 2 buffers
map("n", "<leader><tab>", "<C-^>", default_opts)

-- Indent in visual mode
map("x", "<s-tab>", "<gv", default_opts)
map("x", "<tab>", ">gv", default_opts)

-- Remove ex-mode
map("", "Q", "", {})
map("", "gq", "", {})
map("", "<M-Q>", "", {})

-- Split
map("n", "vs", ":<C-u>split<CR>", default_opts)
map("n", "vv", ":<C-u>vsplit<CR>", default_opts)

-- Next search
map("n", "n", "nzzzv", default_opts)
map("n", "N", "Nzzzv", default_opts)

-- Resize
map("n", "<C-M-H>", "<C-W><", default_opts)
map("n", "<C-M-L>", "<C-W>>", default_opts)
map("n", "<C-M-K>", "<C-W>-", default_opts)
map("n", "<C-M-J>", "<C-W>+", default_opts)

-----------------------------------------------------------
-- Applications & Plugins shortcuts:
-----------------------------------------------------------
-- Vista tag-viewer
map("n", "<C-m>", ":Vista!!<CR>", default_opts) -- open/close

-- nvim-tree
map("n", "<C-n>", ":NvimTreeToggle<CR>", default_opts) -- open/close
map("n", "<reader>rr", ":NvimTreeRefresh<CR>", default_opts) -- refresh
map("n", "<leader>n", ":NvimTreeFindFile<CR>", default_opts) -- search file

-- Goyo
map("n", "<leader>go", ":Goyo<CR>", default_opts) --  Goyo, distraction-free writing in vim

-- Trouble
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", default_opts)
map("n", "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", default_opts)
map("n", "<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<cr>", default_opts)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", default_opts)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", default_opts)
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", default_opts)

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", default_opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", default_opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", default_opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", default_opts)

-- Undotree
map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", default_opts)

-- DAP
local default_opts_dap = {noremap = false, silent = true}
map("n", "<leader>d<space>", ":lua require'dap'.continue()<CR>", default_opts)
map("n", "<leader>dl", ":lua require'dap'.setp_over()<CR>", default_opts_dap)
map("n", "<leader>dj", ":lua require'dap'.step_into()<CR>", default_opts_dap)
map("n", "<leader>dk", ":lua require'dap'.step_out()<CR>", default_opts_dap)
map("n", "<leader>dbp", ":lua require'dap'.toggle_breakpoint()<CR>", default_opts_dap)
map(
  "n",
  "<leader>dcbp",
  ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  default_opts_dap
)
map("n", "<leader>dr", ":lua require'dap'.repl.open()<CR>", default_opts_dap)
map("n", "<leader>dd", ":lua require'dap'.run_last()<CR>", default_opts_dap)
map("n", "<leader>drc", ":lua require'dap'.run_to_cursor()<CR>", default_opts_dap)
map("n", "<leader>ds", "<cmd>lua require'dap.ui.variables'.scopes()<CR>", default_opts_dap)
map("n", "<leader>dh", "<cmd>lua require'dap.ui.variables'.hover()<CR>", default_opts_dap)
map("v", "<leader>dv", "<cmd>lua require'dap.ui.variables'.visual_hover()<CR>", default_opts_dap)
map("n", "<leader>duh", "<cmd>lua require'dap.ui.widgets'.hover()<CR>", default_opts_dap)
map(
  "n",
  "<leader>duf",
  "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>",
  default_opts_dap
)
map("n", "<leader>dui", "<cmd>lua require'dapui'.toggle()<CR>", default_opts_dap)

-- Telescope-dap
map("n", "<leader>dcc", "<cmd>lua require'telescope'.extensions.dap.commands{}<CR>", default_opts_dap)
map("n", "<leader>dco", "<cmd>lua require'telescope'.extensions.dap.configurations{}<CR>", default_opts_dap)
map("n", "<leader>dlb", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints{}<CR>", default_opts_dap)
map("n", "<leader>dv", "<cmd>lua require'telescope'.extensions.dap.variables{}<CR>", default_opts_dap)
map("n", "<leader>df", "<cmd>lua require'telescope'.extensions.dap.frames{}<CR>", default_opts_dap)

-- Doge
map("n", "<leader>dog", "<cmd>DogeGenerate<CR>", default_opts)
