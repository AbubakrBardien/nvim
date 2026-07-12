return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local render_markdown = require("render-markdown")

		render_markdown.setup { enabled = false }

		vim.keymap.set("n", "<leader>m", render_markdown.toggle, { desc = "Render Markdown" })
	end,
}
