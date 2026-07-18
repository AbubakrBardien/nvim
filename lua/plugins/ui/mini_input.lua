return {
	"nvim-mini/mini.input",
	config = function()
		require("mini.input").setup {
			scope = "cursor",
			window = {
				border = "rounded",
			},
		}
	end,
}
