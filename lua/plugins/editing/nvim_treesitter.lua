return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = {},
			sync_install = false,
			ignore_install = {},
			modules = {},

			auto_install = true,
			highlight = {
				enable = true,
				disable = function(lang, buf) -- ask for help with this on GitHub
					return vim.bo.filetype == "trouble"
				end,
			},
		}
	end,
}
