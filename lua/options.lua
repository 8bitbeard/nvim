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
  autoindent = true,
  completeopt=menu,menuone,noselect,
  clipboard='unnamedplus'
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd([[
  ""filetype plugin indent on

  function! EchoStrategy(cmd)
      echo 'TermExec cmd="' . a:cmd . '"'
  endfunction

  function! ToggletermStrategy(cmd)
      execute 'TermExec cmd=' . a:cmd
  endfunction

  let g:test#custom_strategies = { 'echo': function('EchoStrategy'),  'toggleterm': function('ToggletermStrategy')}

  let g:test#strategy = 'neovim'
  let g:test#echo_command = 0
  let g:test#neovim#start_normal = 1
  let g:test#preserve_screen = 1

  autocmd FileType elixir setlocal commentstring=#\ %s
  autocmd Filetype json let g:indentLine_setConceal = 0
]])

vim.g.highlightedyank_highlight_duration = 40

vim.g.better_whitespace_enabled = 1
-- vim.g.strip_whitespace_on_save = 1
--
vim.g.vim_json_conceal=0
vim.g.vim_json_syntax_conceal = 0
