require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"go",
		"css",
		"html",
		"javascript",
		"json",
		"lua",
		"markdown",
		"markdown_inline",
		"php",
		"python",
		"regex",
		"ruby",
		"rust",
		"sql",
		"typescript",
		"vim",
		"yaml",
	},
	highlight = {
		enable = true,
	},
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,

	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
})
