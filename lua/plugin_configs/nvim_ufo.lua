return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		require("ufo").setup {
			provider_selector = function(bufnr, filetype, buftype)
				-- stylua: ignore start

				-- Define filetypes/buftypes where you don't want folds
				local no_fold_filetypes = {
					"NvimTree",
					"TelescopePrompt",
					"TelescopeResults",
					"help",
					"man",
					"dashboard",
					"lazy",            -- For lazy.nvim's plugin list
					"mason",           -- For mason.nvim's UI
					"gitcommit",       -- Often want to disable folding here
				}
				local no_fold_buftypes = {
					"nofile",          -- For empty buffers
					"prompt",
					"quickfix",
					"loclist",
				}

				-- stylua: ignore end

				if vim.tbl_contains(no_fold_filetypes, filetype) or vim.tbl_contains(no_fold_buftypes, buftype) then
					return "" -- Tell ufo to provide no folds for this buffer
				end

				-- return { "lsp", "treesitter", "indent" } -- request the ability to do this
				return { "lsp", "indent" }
			end,
		}
	end,
}
