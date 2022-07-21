local options = {
  splitright = true,
  hidden = true,
  errorbells = false,
  termguicolors = true,
  background = 'dark',
  number = true,
  relativenumber = true,
  scrolloff = 12,
  wrap = false,
  cursorline = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  updatetime = 50,
  swapfile = false,
  backup = false,
  undodir = os.getenv("HOME") .. "/.vim/undodir",
  undofile = true,
  hlsearch = false,
  incsearch = true,
  foldenable = false,
  completeopt=menu,menuone,noselect,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd([[
  colorscheme gruvbox
  let g:test#strategy = 'harpoon'
]])

vim.g.highlightedyank_highlight_duration = 40

