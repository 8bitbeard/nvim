require("harpoon").setup ({
  menu = {
      width = vim.api.nvim_win_get_width(0) - 40
  }
})

vim.api.nvim_set_keymap('n', '<C-t>', '<cmd>lua require("harpoon.term").gotoTerminal(1)<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>lua require("harpoon.mark").add_file()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-e>', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', { silent = true })


