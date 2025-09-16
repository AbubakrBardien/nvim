local globals = require("globals")

return {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		-- require("onedarkpro").setup {
		-- colors = { onedark = { bg = "#191c1f" } },
		-- }

		require("onedarkpro").setup {}

		if globals.colorscheme:match("^onedark") then
			vim.api.nvim_command("colorscheme " .. globals.colorscheme)
		end
	end,
}
