return {
	"nvim-mini/mini.map",
	config = function()
		local map = require("mini.map")

		map.setup {
			symbols = {
				scroll_line = "█",
				scroll_view = "▒",
				encode = map.gen_encode_symbols.dot("4x2"),
			},
			integrations = {
				map.gen_integration.builtin_search(),
				map.gen_integration.diagnostic(),
				map.gen_integration.diff(),
				map.gen_integration.gitsigns(),
			},
			window = {
				show_integration_count = false,
			},
		}

		vim.keymap.set("n", "<leader>mt", map.toggle, { desc = "Toggle MiniMap" })
	end,
}
