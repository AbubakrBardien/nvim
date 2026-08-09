return {
	"NeogitOrg/neogit",
	dependencies = {
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local neogit = require("neogit")
		local telescope_builtin = require("telescope.builtin")
		local diffview = require("diffview")

		diffview.setup {}

		neogit.setup {
			integrations = { diffview = true },
			mappings = {
				status = {
					["<cr>"] = "Toggle", -- Make Enter toggle folds/sections
					["o"] = "GoToFile", -- Assign 'o' (or '<tab>') to open the file/diff in a buffer
				},
			},
		}

		vim.keymap.set("n", "<leader>gs", function()
			neogit.open { kind = "floating" }
		end, { desc = "Show Neogit " })

		-- stylua: ignore start
		vim.keymap.set("n", "<leader>gb", telescope_builtin.git_branches, { desc = "Show Neogit " })
		vim.keymap.set("n", "<leader>gd", diffview.open,                  { desc = "Open Diffview (Working Tree)" })
		vim.keymap.set("n", "<leader>gh", diffview.file_history,          { desc = "File History (Diffview)" })
		vim.keymap.set("n", "<leader>gc", diffview.close,                 { desc = "Close Diffview" })
		-- stylua: ignore end
	end,
}
