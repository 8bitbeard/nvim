require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "typescript", "java", "lua", "elixir", "rust", "go", "python" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true
  }
}



-- local status_ok, configs = pcall(require("nvim-treesitter.configs"))
-- if not status_ok then
--   return
-- end


-- configs.setup {
--   ensure_installed = { "maintained" },
--   sync_install = false,
--   ignore_install = {},
--   auto_install = true,
--   highlight = {
--     enable = true,
--     additional_vim_regex_highlighting = false
--   },
--   indent = {
--     enable = true,
--     disable = { "yaml" }
--   }
-- }

-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     vim.opt.foldmethod     = 'expr'
--     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--   end
-- })

