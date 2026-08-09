return {
	"folke/tokyonight.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		local globals = require("globals")

		require("tokyonight").setup()

		if globals.colorscheme:match("^tokyonight") then
			vim.api.nvim_command("colorscheme " .. globals.colorscheme)
		end
	end,
}
