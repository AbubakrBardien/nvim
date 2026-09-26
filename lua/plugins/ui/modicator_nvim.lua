return {
	"mawkler/modicator.nvim",
	config = function()
		vim.opt.cursorline = true
		vim.o.termguicolors = true
		vim.o.number = true

		require("modicator").setup {
			highlights = {
				defaults = {
					bold = true,
				},
			},
		}
	end,
}
