-- local status_ok, nvim_treesitter_configs = pcall(require("nvim-treesitter.configs"))
-- if not status_ok then
-- 	return
-- end

local nvim_treesitter_configs = require("nvim-treesitter.configs")

nvim_treesitter_configs.setup({
	ensure_installed = {
		"elixir",
		"go",
    "http",
		"java",
		"javascript",
    "json",
		"lua",
		"python",
		"rust",
		"typescript",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})
