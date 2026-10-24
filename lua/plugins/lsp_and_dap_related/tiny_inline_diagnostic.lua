return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		vim.diagnostic.config { virtual_text = false } -- Disable Neovim's default virtual text diagnostics

		require("tiny-inline-diagnostic").setup {
			-- Based on the "powerline" preset
			signs = {
				arrow = "   ",
				up_arrow = "",
				right = " ",
				left = "",
				diag = "",
			},
			options = {
				set_arrow_to_diag_color = true,
				use_icons_from_diagnostic = true,
			},
		}
	end,
}
