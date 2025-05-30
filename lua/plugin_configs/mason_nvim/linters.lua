return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile", "BufWritePost" },
		config = function()
			require("lint").linters_by_ft = {
				sh = { "shellcheck" }, -- Needed for "bash-langauge-server"
			}
		end,
	},

	vim.diagnostic.config {
		virtual_text = false,
		update_in_insert = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.INFO] = "",
				[vim.diagnostic.severity.HINT] = "",
			},
		},
	},
}
