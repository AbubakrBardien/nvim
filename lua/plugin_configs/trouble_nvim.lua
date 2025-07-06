return {
	"folke/trouble.nvim",
	event = "VeryLazy",
	cmd = "Trouble",
	-- dependencies = { "echasnovski/mini.icons" }, -- make a request to incorporate this plugin more easily
	config = function()
		local common_mode_settings = {
			win = {
				position = "right",
				size = 0.275,
			},
		}

		local modes_to_configure = {
			"lsp_references",
			"lsp",
			"symbols",
		}

		local modes_table = {}
		for _, mode_name in ipairs(modes_to_configure) do
			modes_table[mode_name] = common_mode_settings
		end

		local trouble = require("trouble")
		local toggle = require("trouble").toggle

		trouble.setup {
			focus = true,
			modes = modes_table,
			icons = {
				kinds = {
					Boolean = " ",
					Constant = " ",
					Enum = " ",
					EnumMember = " ",
					Field = " ",
					Function = " ",
					Key = " ",
					Method = " ",
					Module = " ",
					Namespace = " ",
					Null = " ",
					Number = " ",
					Object = " ",
					Package = " ",
					Property = " ",
					String = " ",
					Struct = " ",
					Variable = " ",
				},
			},
		}

		vim.keymap.set("n", "<leader>xd", function()
			toggle("diagnostics")
		end, { desc = "Diagnostics (Trouble)" })

		vim.keymap.set("n", "<leader>gr", function()
			toggle("lsp_references")
		end, { desc = "LSP References (Trouble)" })

		vim.keymap.set("n", "<leader>xs", function()
			toggle("symbols")
		end, { desc = "Symbols (Trouble)" })

		vim.keymap.set("n", "<leader>xx", function()
			toggle("diagnostics")
			toggle("symbols")
		end, { desc = "IDE-like Workspace (Trouble)" })

		vim.keymap.set("n", "<leader>xa", function()
			toggle("lsp")
		end, { desc = "LSP Summary (Trouble)" })

		vim.keymap.set("n", "<leader>xc", function()
			trouble.close()
		end, { desc = "Close Trouble Window" })
	end,
}
