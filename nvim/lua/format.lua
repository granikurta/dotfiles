local form = require("conform")

form.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = {"prettier"},
	typescript = { "prettier" },
    vue = {"prettier"},
    sql = {"sql_formatter"},
  },
	-- format_on_save = {
	-- 		lsp_fallback = true,
	-- 		async = false,
	-- 		timeout_ms = 1000,
	-- 	  },

})
form.formatters.sql_formatter = {
	prepend_args = { "-c", vim.fn.expand("~/.config/sql_formatter.json") },
}
vim.keymap.set('n', '<leader>p', function() form.format({ async = false, print('formating...')}) end, {silent = false})

