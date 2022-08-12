vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }


-- Custom
keymap('n', '<leader>bb', ':b#<CR>', {})
keymap('n', '<leader>qq', ':bd<CR>', {})
keymap('n', '<leader>wq', ':%bd<bar>e#<bar>bd#<CR>', {})
keymap('n', '<leader>]', ':bnext<CR>', {})
keymap('n', '<leader>[', ':bprevious<CR>', {})
keymap('n', '<leader>ez', ':e $HOME/.zshrc<CR>', {})
keymap('n', '<leader>et', ':e $HOME/.tmux.conf<CR>', {})
keymap('n', '<leader>ek', ':e $HOME/.config/nvim/lua/keymaps.lua<CR>', {})
keymap('n', '<leader>ev', ':e $HOME/.config/nvim/init.lua<CR>', {})


-- Built In LSP
-- keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', options)
-- keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', options)
-- keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', options)
-- keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', options)
-- keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
-- keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', options)
-- keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', options)
-- keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', options)
-- keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', options)
-- keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', options)
-- keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', options)
-- keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostics.show_line_diagnostics()<CR>', options)
-- keymap('n', '[d', '<cmd>lua vim.lsp.diagnostics.goto_prev()<CR>', options)
-- keymap('n', ']d', '<cmd>lua vim.lsp.diagnostics.goto_next()<CR>', options)
-- keymap('n', '<leader>ff', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 1000)<CR>', options)


-- Telescope
keymap('n', '<C-p>', '<cmd>lua require("telescope.builtin").find_files()<CR>', options)
keymap('n', '<C-g>', '<cmd>lua require("telescope.builtin").git_files()<CR>', options)
keymap('n', '<C-o>', '<cmd>lua require("telescope.builtin").buffers()<CR>', options)
keymap('n', 'fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', options)
keymap('n', 'fh', '<cmd>lua require("telescope.builtin").help_tags()<CR>', options)


-- Harpoon
keymap('n', '<C-t>', '<cmd>lua require("harpoon.term").gotoTerminal(1)<CR>', options)
keymap('n', '<C-s>', '<cmd>lua require("harpoon.mark").add_file()<CR>', options)
keymap('n', '<C-e>', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', options)
keymap('n', '<C-h>', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', options)
keymap('n', '<C-j>', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', options)
keymap('n', '<C-k>', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', options)
keymap('n', '<C-l>', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', options)


-- Vim Test
keymap('n', '<leader>t', ':TestNearest<CR>', options)
keymap('n', '<leader>T', ':TestFile<CR>', options)
keymap('n', '<leader>a', ':TestSuite<CR>', options)
keymap('n', '<leader>l', ':TestLast<CR>', options)
keymap('n', '<leader>g', ':TestVisit<CR>', options)


-- Nvim Tree
vim.api.nvim_set_keymap("n", "<leader>nn", ":NvimTreeToggle<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>nr", ":NvimTreeRefresh<CR>", options)
vim.api.nvim_set_keymap("n", "<leader>nf", ":NvimTreeFindFile<CR>", options)



