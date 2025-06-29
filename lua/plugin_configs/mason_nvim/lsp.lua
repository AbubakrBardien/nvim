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

-- Local Keymaps for LSP
local function setup_lsp_keymaps(client, bufnr)
	local telescope_builtins = require("telescope.builtin")

	-- stylua: ignore start
	vim.keymap.set("n", "<C-k>",          vim.lsp.buf.hover,                 { buffer = bufnr, desc = "Display Hover Information" })
	vim.keymap.set({ "n", "i" }, "<C-l>", vim.lsp.buf.signature_help,        { buffer = bufnr, desc = "Display Signature Help" })
	vim.keymap.set("n", "gca",            vim.lsp.buf.code_action,           { buffer = bufnr, desc = "Code Action" })
	vim.keymap.set("n", "gra",            vim.lsp.buf.rename,                { buffer = bufnr, desc = "Rename Symbol" })
	vim.keymap.set("n", "gdf",            vim.lsp.buf.definition,            { buffer = bufnr, desc = "Go to Definition" })
	vim.keymap.set("n", "gdc",            vim.lsp.buf.declaration,           { buffer = bufnr, desc = "Go to Declaration" })
	vim.keymap.set("n", "gi",             vim.lsp.buf.implementation,        { buffer = bufnr, desc = "Go to Implementation" })
	-- stylua: ignore end
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

			local lsp_set = {
				"lua_ls", -- "lua-language-server"
				"clangd",
				"pyright",
				"bashls", -- "bash-language-server"
			}

			for _, lsp in pairs(lsp_set) do
				local opts = {
					capabilities = get_capabilities(),
					on_attach = setup_lsp_keymaps,
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
