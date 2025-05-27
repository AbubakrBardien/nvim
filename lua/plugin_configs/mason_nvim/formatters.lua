return {
	"stevearc/conform.nvim",
	lazy = false,
	config = function()
		require("conform").setup {
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		}
	end,
}
