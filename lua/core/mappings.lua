local M = {}

local opts = { noremap = true, silent = true }

local map = vim.api.nvim_set_keymap

-- Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- NvimTree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>o", ":NvimTreeFocus<CR>", opts)

-- Dashboard
map("n", "<leader>fn", ":DashboardNewFile<CR>", opts)
map("n", "<leader>db", ":Dashboard<CR>", opts)
map("n", "<leader>bm", ":DashboardJumpMarks<CR>", opts)
map("n", "<leader>sl", ":SessionLoad<CR>", opts)
map("n", "<leader>ss", ":SessionSave<CR>", opts)

-- Telescope
map("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
map("n", "<leader>gt", ":Telescope git_status<CR>", opts)
map("n", "<leader>gc", ":Telescope git_commits<CR>", opts)
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
map("n", "<leader>fo", ":Telescope oldfiles<CR>", opts)

-- Lspsag
map("n", "gl", ":Lspsaga show_line_diagnostics<CR>", opts)
map("n", "ga", ":Lspsaga code_action<CR>", opts)
map("n", "K", ":Lspsaga hover_doc<CR>", opts)
map("n", "rn", ":Lspsaga rename<CR>", opts)
map("n", "gj", ":Lspsaga diagnostic_jump_next<cr>", opts)
map("n", "gk", ":Lspsaga diagnostic_jump_prev<cr>", opts)
map("n", "<C-u>", ":lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", opts)
map("n", "<C-d>", ":lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", opts)

-- Comment
map("n", "<leader>/", ":lua require('Comment.api').toggle_current_linewise()<CR>", opts)
map("v", "<leader>/", "<esc>:lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>", opts)

-- Pounce
map("n", "s", ":Pounce<CR>", opts)
map("n", "S", ":PounceRepeat<CR>", opts)
map("v", "s", ":Pounce<CR>", opts)
map("x", "gs", ":Pounce<CR>", opts)

-- ForceWrite
map("n", "<C-w>", ":w!<CR>", opts)

-- ForceQuit
map("n", "<C-q>", ":q!<CR>", opts)

-- Terminal
map("n", "<C-\\>", ":ToggleTerm<CR>", opts)

-- SymbolsOutline
map("n", "<leader>s", ":SymbolsOutline<CR>", opts)

-- SaveSession
map("n", "<leader>ss", ":SessionSave<CR>", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)
map("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

return M
