return {
	"folke/trouble.nvim",
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
		vim.keymap.set("n", "<leader>xd", function() trouble.toggle("diagnostics") end,    { desc = "Diagnostics (Trouble)" })
		vim.keymap.set("n", "grr",        function() trouble.toggle("lsp_references") end, { desc = "LSP References (Trouble)" })
		vim.keymap.set("n", "<leader>xs", function() trouble.toggle("symbols") end,        { desc = "Symbols (Trouble)" })
		vim.keymap.set("n", "<leader>xa", function() trouble.toggle("lsp") end,            { desc = "LSP Summary (Trouble)" })
		vim.keymap.set("n", "<leader>xc", function() trouble.close() end,                  { desc = "Close Trouble Window" })
		-- stylua: ignore end

		-- Highlights
		vim.api.nvim_set_hl(0, "TroubleNormal", { link = "Normal" })
		vim.api.nvim_set_hl(0, "TroubleNormalNC", { link = "Normal" })
	end,
}
