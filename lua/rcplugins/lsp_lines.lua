require("lsp_lines").setup();

vim.diagnostic.config({ virtual_lines = true })
vim.diagnostic.config({
  virtual_text = false,
})
