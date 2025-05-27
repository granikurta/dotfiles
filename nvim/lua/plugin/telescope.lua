 local telescope = require "telescope"
telescope.setup {
	defaults = {
		file_ignore_patterns = { "^vendor/", "^node_modules/" },
		initial_mode = "normal",
        pickers = {
                live_grep = {
                    additional_args = function(_)
                        return { "--hidden" }
                    end
                },
            },
	}
}

telescope.load_extension("live_grep_args")
