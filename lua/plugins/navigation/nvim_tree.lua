return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		local nvim_tree = require("nvim-tree")
		local nvim_tree_api = require("nvim-tree.api")
		local NVIM_TREE = { fg = "#71B0E8" }

		nvim_tree.setup {
			view = {
				width = {
					min = 35,
					padding = 1,
				},
				-- side = "right",
				relativenumber = true,
			},
			filters = { dotfiles = false },
			hijack_cursor = true,
			disable_netrw = true,
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			renderer = {
				group_empty = true,
				full_name = true,
				indent_width = 4,
				indent_markers = { enable = true },
				icons = {
					show = { folder_arrow = false },
					glyphs = { git = { unmerged = "" } },
				},
				root_folder_label = ":t/",
			},
		}

		-- Keymaps
		vim.keymap.set("n", "<C-n>", function()
			nvim_tree_api.tree.toggle()
		end, { desc = "Toggle Nvim Tree" })

		-- Highlights
		vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", NVIM_TREE)
		vim.api.nvim_set_hl(0, "NvimTreeRootFolder", NVIM_TREE)
		vim.api.nvim_set_hl(0, "NvimTreeFolderName", NVIM_TREE)
		vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", NVIM_TREE)
		vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", NVIM_TREE)
		vim.api.nvim_set_hl(0, "NvimTreeSymlinkFolderName", NVIM_TREE)
	end,
}
