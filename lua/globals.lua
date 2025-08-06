local M = {}

M.colorscheme = "onedark"

---@diagnostic disable-next-line: unused-local
M.on_attach = function(client, bufnr)
	-- stylua: ignore start
	vim.keymap.set("n", "<C-k>",          vim.lsp.buf.hover,          { buffer = bufnr, desc = "Display Hover Information" })
	vim.keymap.set({ "n", "i" }, "<C-l>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Display Signature Help" })
	vim.keymap.set("n", "gca",            vim.lsp.buf.code_action,    { buffer = bufnr, desc = "Code Action" })
	vim.keymap.set("n", "gdf",            vim.lsp.buf.definition,     { buffer = bufnr, desc = "Go to Definition" })
	vim.keymap.set("n", "gdc",            vim.lsp.buf.declaration,    { buffer = bufnr, desc = "Go to Declaration" })
	vim.keymap.set("n", "gi",             vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to Implementation" })
	-- stylua: ignore end
end

-- Function to extend LSP Capabilities
local function get_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	-- Add the foldingRange capability for nvim-ufo
	capabilities.textDocument.foldingRange = {
		dynamicRegistration = false,
		lineFoldingOnly = true,
	}

	return capabilities
end

M.capabilities = get_capabilities()

return M
