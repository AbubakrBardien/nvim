local globals = require("globals")

return {
	"folke/tokyonight.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("tokyonight").setup()

		if globals.colorscheme:match("^tokyonight") then
			vim.api.nvim_command("colorscheme " .. globals.colorscheme)
		end
	end,
}
