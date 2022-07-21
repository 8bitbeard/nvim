require'nvim-tree'.setup {
  view = {
      width = 45, side = "left"
  }
}

require("nvim-web-devicons").setup()

vim.api.nvim_set_keymap("n", "<leader>nn", ":NvimTreeToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>nr", ":NvimTreeRefresh<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>nf", ":NvimTreeFindFile<CR>", { noremap = true })

