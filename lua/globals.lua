local M = {}

-- M.colorscheme = "tokyonight-storm"
M.colorscheme = "tokyonight-moon"
-- M.colorscheme = "tokyonight-night"
-- M.colorscheme = "onedark_vivid"
-- M.colorscheme = "onedark_dark"

-- This function retrieves a color from a highlight group.
M.get_hl_color = function(group_name)
	local hl_group = vim.api.nvim_get_hl(0, { name = group_name, link = false })
	if hl_group and hl_group.bg then
		return string.format("#%06x", hl_group.bg)
	end
	return nil
end

---@diagnostic disable-next-line: unused-local
M.on_attach = function(client, bufnr)
	-- stylua: ignore start
	vim.keymap.set("n", "<C-k>",          vim.lsp.buf.hover,           { buffer = bufnr, desc = "Display Hover Information" })
	vim.keymap.set({ "n", "i" }, "<C-l>", vim.lsp.buf.signature_help,  { buffer = bufnr, desc = "Display Signature Help" })
	vim.keymap.set("n", "gca",            vim.lsp.buf.code_action,     { buffer = bufnr, desc = "Code Action" })
	vim.keymap.set("n", "grn",            vim.lsp.buf.rename,          { buffer = bufnr, desc = "Rename Symbol" })
	vim.keymap.set("n", "gdf",            vim.lsp.buf.definition,      { buffer = bufnr, desc = "Go to Definition" })
	vim.keymap.set("n", "gdc",            vim.lsp.buf.declaration,     { buffer = bufnr, desc = "Go to Declaration" })
	vim.keymap.set("n", "gi",             vim.lsp.buf.implementation,  { buffer = bufnr, desc = "Go to Implementation" })
	vim.keymap.set("n", "gt",             vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Go to Type-Definition" })
	-- stylua: ignore end
	vim.keymap.set("n", "<C-h>", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
	end, { buffer = bufnr, desc = "Toggle Inlay Hints" })
end

local function get_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()

	-- stylua: ignore start
	capabilities.textDocument = {
		-- Add the foldingRange capability for the "nvim-ufo" plugin
		foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		},
		formatting = {},      -- Neovim tells the Language Server that it's capable of Document Formatting
		rangeFormatting = {}, -- Neovim tells the Language Server that it's capable of formatting a Range of Text
	}
	-- stylua: ignore end

	return capabilities
end

M.capabilities = get_capabilities()

return M
