local function media_aware_on_attach(bufnr)
	local nvim_tree_api = require("nvim-tree.api")
	-- First, inject all default nvim-tree keymaps
	nvim_tree_api.map.on_attach.default(bufnr)

	-- Define a custom open function for media assets
	local function smart_open()
		local node = nvim_tree_api.tree.get_node_under_cursor()

		-- Ensure we actually selected a file
		if node and node.type == "file" then
			local extension = vim.fn.fnamemodify(node.name, ":e"):lower()

			-- List the media extensions you want to intercept
			-- stylua: ignore start
			local media_extensions = {
				png = true, jpg = true,  jpeg = true,
				gif = true, webp = true, mp4 = true,
				mkv = true, mov = true,  avi = true,
			}
			-- stylua: ignore end

			if media_extensions[extension] then
				-- Safely hand the absolute file path to xdg-open (triggers gThumb/mpv)
				vim.fn.jobstart({ "xdg-open", node.absolute_path }, { detach = true })
				return
			end
		end

		-- If it's a normal text file or directory, fall back to standard nvim-tree open behavior
		nvim_tree_api.node.open.edit()
	end

	-- Override <CR> (Enter) and 'o' to use our smart opener inside nvim-tree buffers
	local opts = { buffer = bufnr, noremap = true, silent = true, desc = "Smart Open Media" }
	vim.keymap.set("n", "<CR>", smart_open, opts)
	vim.keymap.set("n", "o", smart_open, opts)
end

return {
	"nvim-tree/nvim-tree.lua",
	lazy = false,
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		local nvim_tree = require("nvim-tree")
		local nvim_tree_api = require("nvim-tree.api")
		local NVIM_TREE = { fg = "#71B0E8" }

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
			on_attach = media_aware_on_attach,
		}
	end,
}
