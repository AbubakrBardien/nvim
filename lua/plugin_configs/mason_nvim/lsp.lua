return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		-- Allows Neovim to communicate with Language Servers
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/lazydev.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			local lsp_set = {
				"lua_ls", -- "lua-language-server"
				"clangd",
				"pyright",
				"bashls", -- "bash-language-server"
			}
			local lspconfig = require("lspconfig")

			for _, lsp in pairs(lsp_set) do
				if lsp == "clangd" then
					lspconfig[lsp].setup { -- "clang-tidy" is the built-in linter
						cmd = { "clangd", "--offset-encoding=utf-16", "--clang-tidy" },
					}
				else
					lspconfig[lsp].setup {}
				end
			end
		end,
	},
}
