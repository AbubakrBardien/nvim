-- Define a function to modify LSP Capabilities
local function get_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	-- Add the foldingRange capability for nvim-ufo
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	return capabilities
end

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
			local lspconfig = require("lspconfig")
			local capabilities = get_capabilities() -- Get the combined capabilities

			local lsp_set = {
				"lua_ls", -- "lua-language-server"
				"clangd",
				"pyright",
				"bashls", -- "bash-language-server"
			}

			for _, lsp in pairs(lsp_set) do
				local opts = {
					capabilities = capabilities,
				}

				if lsp == "clangd" then
					-- "clang-tidy" is the built-in linter
					opts.cmd = { "clangd", "--offset-encoding=utf-16", "--clang-tidy" }
				end
				lspconfig[lsp].setup(opts)
			end
		end,
	},
}
