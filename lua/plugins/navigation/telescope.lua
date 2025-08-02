return {
	-- Search Tool / Fuzzy Finder
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"echasnovski/mini.icons",
	},
	config = function()
		local telescope = require("telescope")
		local telescope_builtins = require("telescope.builtin")
		local telescope_actions = require("telescope.actions")
		local custom_picker = require("custom_script_files.convert_file")
		local trouble = require("trouble.sources.telescope")

		local size_keymaps = { height = 24, width = 95 }
		local size_fuzzy_find = { height = 0.65, width = 0.65 }

		telescope.setup {
			defaults = {
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",
					height = 0.68,
					width = 0.85,
				},
				mappings = {
					i = {
						["<esc>"] = telescope_actions.close,
						["<c-t>"] = trouble.open,
					},
				},
			},
			pickers = {
				keymaps = {
					layout_config = size_keymaps,
				},
				current_buffer_fuzzy_find = {
					previewer = false,
					layout_config = size_fuzzy_find,
				},
			},
		}

		-- stylua: ignore start
		vim.keymap.set("n", "<leader>ff", telescope_builtins.find_files,       { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fp", telescope_builtins.live_grep,        { desc = "Fuzzy-Find in Project" })
		vim.keymap.set("n", "<leader>fb", telescope_builtins.buffers,          { desc = "Search Buffers" })
		vim.keymap.set("n", "<leader>fh", telescope_builtins.help_tags,        { desc = "Search Help Tags" })
		vim.keymap.set("n", "<leader>fr", telescope_builtins.oldfiles,         { desc = "Search Recent Files" })
		vim.keymap.set("n", "<leader>fk", telescope_builtins.keymaps,          { desc = "Search Keymaps" })
		vim.keymap.set("n", "<leader>fc", function() custom_picker:find() end, { desc = "Open File Conversion Menu" })
		-- stylua: ignore end

		-- Custom Telescope Picker to search in the Source Code directories of installed plugins
		vim.keymap.set("n", "<leader>fsc", function()
			telescope_builtins.find_files {
				cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
			}
		end, { desc = "Search Plugin Source Code" })
	end,
}
