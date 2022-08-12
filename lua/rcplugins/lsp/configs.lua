-- local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
-- if not status_ok then
-- 	return
-- end

-- local lspconfig = require("lspconfig")

-- local servers = { "jsonls", "sumneko_lua", "tsserver", "lemminx", "sqlls", "elixirls" }

-- lsp_installer.setup({
-- 	ensure_installed = servers,
-- })

-- for _, server in pairs(servers) do
-- 	local opts = {
-- 		on_attach = require("rcplugins.lsp.handlers").on_attach,
-- 		capabilities = require("rcplugins.lsp.handlers").capabilities,
-- 	}
-- 	local has_custom_opts, server_custom_opts = pcall(require, "rcplugins.lsp.settings." .. server)
-- 	if has_custom_opts then
-- 		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
-- 	end
-- 	lspconfig[server].setup(opts)
-- end


local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local servers = { "jsonls", "sumneko_lua", "tsserver", "elixirls", "solargraph", "intelephense" }

mason_lspconfig.setup({
  ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("rcplugins.lsp.handlers").on_attach,
		capabilities = require("rcplugins.lsp.handlers").capabilities,
	}
	local has_custom_opts, server_custom_opts = pcall(require, "rcplugins.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end

