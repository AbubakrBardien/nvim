return {
	-- Search Tool / Fuzzy Finder
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-mini/mini.icons",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local telescope_builtin = require("telescope.builtin")
		local telescope_actions = require("telescope.actions")
		local telescope_themes = require("telescope.themes")
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
			extensions = {
				["ui-select"] = {
					telescope_themes.get_cursor {
						layout_config = {
							width = 0.36,
							height = 7,
						},
					},
				},
			},
		}

		telescope.load_extension("ui-select")

		-- stylua: ignore start
		vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files,       { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fp", telescope_builtin.live_grep,        { desc = "Fuzzy-Find in Project" })
		vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags,        { desc = "Search Help Tags" })
		vim.keymap.set("n", "<leader>fr", telescope_builtin.oldfiles,         { desc = "Search Recent Files" })
		vim.keymap.set("n", "<leader>fc", function() custom_picker:find() end, { desc = "Open File Conversion Menu" })
		-- stylua: ignore end

		vim.keymap.set("n", "<leader>fk", function()
			telescope_builtin.keymaps { show_plug = false }
		end, { desc = "Search Custom Keymaps" })

		vim.keymap.set("n", "<leader>fb", function()
			telescope_builtin.buffers {
				attach_mappings = function(prompt_bufnr, map)
					-- Define the Delete action
					local delete_buf = function()
						telescope_actions.delete_buffer(prompt_bufnr)
					end

					-- Map it to <C-d> (Ctrl+D) in both Normal and Insert mode inside Telescope
					map("n", "<C-d>", delete_buf)
					map("i", "<C-d>", delete_buf)

					return true
				end,
			}
		end, { desc = "Search Buffers" })

		-- Custom Telescope Picker to search in the Source Code directories of installed plugins
		vim.keymap.set("n", "<leader>fsc", function()
			telescope_builtin.find_files {
				cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy"),
			}
		end, { desc = "Search Plugin Source Code" })
	end,
}
