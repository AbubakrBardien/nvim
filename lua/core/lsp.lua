-- Enables the language servers located in "nvim/lsp/"
local function enable_langauge_servers()
	local lsp_file_paths = vim.fn.glob(vim.fn.stdpath("config") .. "/lsp/*.lua", true)

	if type(lsp_file_paths) == "string" then
		lsp_file_paths = vim.split(lsp_file_paths, "\n")
	end

	for _, file_path in ipairs(lsp_file_paths) do
		local filename = vim.fs.basename(file_path)
		local server_name = string.gsub(filename, "%.lua$", "")
		vim.lsp.enable(server_name)
	end
end

return {
	enable_langauge_servers(),

	vim.diagnostic.config {
		virtual_text = false,
		update_in_insert = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.INFO] = "",
				-- [vim.diagnostic.severity.INFO] = "",
				[vim.diagnostic.severity.HINT] = "",
				-- [vim.diagnostic.severity.HINT] = "󰌵",
			},
		},
	},
}
