return {
	"toppair/peek.nvim",
	event = { "VeryLazy" },
	build = "deno task --quiet build:fast",
	config = function()
		local peek = require("peek")

		peek.setup { app = "browser" }

		vim.keymap.set("n", "<leader>po", peek.open, { desc = "Open Preview" })
		vim.keymap.set("n", "<leader>pc", peek.close, { desc = "Close Preview" })
	end,
}
