return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "󰍴" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			numhl = true,
		}

		-- stylua: ignore start
		vim.keymap.set("n", "]c",         function() gitsigns.nav_hunk("next") end, { desc = "Go to Next Hunk" })
		vim.keymap.set("n", "[c",         function() gitsigns.nav_hunk("prev") end, { desc = "Go to Previous Hunk" })
		vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk_inline,             { desc = "Preview Hunk" })
		vim.keymap.set("n", "<leader>ht", gitsigns.stage_hunk,                      { desc = "Stage/Unstage Hunk" })
		vim.keymap.set("n", "<leader>tb", gitsigns.toggle_current_line_blame,       { desc = "Toggle Git Blame" })
		-- stylua: ignore end
	end,
}
