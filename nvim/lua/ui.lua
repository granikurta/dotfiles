-- require("noice").setup({
--  cmdline = {
-- 	view = "cmdline"
--  },
--   lsp = {
--     -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
--     override = {
--       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--       ["vim.lsp.util.stylize_markdown"] = true,
--       ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
--     },
--   },
-- presets = {
-- 		inc_rename = true,
-- 		command_palette = true,
-- 	},
-- })
-- vim.notify = require("notify").setup({
-- 	background_colour = "#000000",
-- 	render = "wrapped-compact",
-- 	timeout = 1500,
-- 	top_down = false,
-- })

-- vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
-- 	local client = vim.lsp.get_client_by_id(ctx.client_id)
-- 	local lvl = ({ "ERROR", "WARN", "INFO", "DEBUG" })[result.type]
-- 	notify(result.message, lvl, {
-- 		title = "LSP | " .. client.name,
-- 		timeout = 10000,
-- 		keep = function()
-- 			return lvl == "ERROR" or lvl == "WARN"
-- 		end,
-- 	})
-- end
-- require("bufferline").setup{}

require("lualine").setup({
	options = {
		section_separators = "",
		component_separators = "",
		theme = require("neofusion.lualine"),
	},
	sections = {
		lualine_a = { "branch", "diff", "diagnostics" },
		lualine_b = { "mode" },
		lualine_c = { "buffers" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = { { "filename", path = 1 } },
	},
})
require("neofusion").setup({
	transparent_mode = true,
})
local function goto_definition(split_cmd)
	local util = vim.lsp.util
	local log = require("vim.lsp.log")
	local api = vim.api

	-- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
	local handler = function(_, result, ctx)
		if result == nil or vim.tbl_isempty(result) then
			local _ = log.info() and log.info(ctx.method, "No location found")
			return nil
		end

		if split_cmd then
			vim.cmd(split_cmd)
		end

		if vim.tbl_islist(result) then
			util.jump_to_location(result[1])

			if #result > 1 then
				-- util.set_qflist(util.locations_to_items(result))
				vim.fn.setqflist(util.locations_to_items(result))
				api.nvim_command("copen")
				api.nvim_command("wincmd p")
			end
		else
			util.jump_to_location(result)
		end
	end

	return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition("split")

-- 
require("colorizer").setup()
