local status_ok, nvim_treesitter_configs = pcall(require("nvim-treesitter.configs"))
if not status_ok then
	return
end

nvim_treesitter_configs.setup({
	ensure_installed = {
		"elixir",
		"go",
		"java",
		"javascript",
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
