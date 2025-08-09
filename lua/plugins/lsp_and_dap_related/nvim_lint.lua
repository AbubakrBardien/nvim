return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile", "BufWritePost" },
	config = function()
		require("lint").linters_by_ft = {
			sh = { "shellcheck" }, -- Needed for "bash-langauge-server"
		}
	end,
}
