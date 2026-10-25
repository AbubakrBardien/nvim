return {
	"folke/trouble.nvim",
	branch = "main", -- Pull directly from main instead of version 3.7.1 tag
	config = function()
		local common_mode_settings = {
			win = {
				position = "right",
				size = 0.275,
			},
		}

		local modes_to_configure = {
			-- "lsp_incoming_calls",
			-- "lsp_outgoing_calls",
			"symbols",
		}

		local modes_table = {}
		for _, mode_name in ipairs(modes_to_configure) do
			modes_table[mode_name] = common_mode_settings
		end

		local trouble = require("trouble")

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

		-- Keymaps
		-- stylua: ignore start
		-- vim.keymap.set("n", "<leader>xc", function() trouble.toggle("lsp_incoming_calls") trouble.toggle("lsp_outgoing_calls") end, { desc = "LSP Incoming/Outgoing calls" })
		vim.keymap.set("n", "<leader>xs", function() trouble.toggle("symbols") end,        { desc = "Document Symbols" })
		-- stylua: ignore end

		-- Highlights
		vim.api.nvim_set_hl(0, "TroubleNormal", { link = "Normal" })
		vim.api.nvim_set_hl(0, "TroubleNormalNC", { link = "Normal" })
	end,
}
