local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup {
  debug = false,
  sources = {
    -- formatting.prettier.with {
    --   extra_filetypes = { "toml", "solidity" },
    --   extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    -- },
    -- formatting.black.with { extra_args = { "--fast" } },
    formatting.prettier,
    formatting.eslint,
    formatting.stylua,
    formatting.mix,
    formatting.rustfmt,
    diagnostics.eslint,
    diagnostics.credo.with{
      extra_args = { "--strict" }
    },
    code_actions.eslint,
    -- formatting.shfmt,
    -- formatting.google_java_format,
    -- diagnostics.flake8,
    -- diagnostics.shellcheck,
  },
}
