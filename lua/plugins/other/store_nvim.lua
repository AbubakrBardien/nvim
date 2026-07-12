return {
	"alex-popov-tech/store.nvim",
	dependencies = { "render-markdown.nvim" },
	config = function()
		require("store").setup {}
	end,
}
