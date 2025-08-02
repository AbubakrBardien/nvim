local globals = require("globals")

return {
	cmd = { "clangd" },
	filetypes = { "c", "cpp" },
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		".git",
	},
	on_attach = globals.on_attach,
	capabilities = globals.capabilities,
}
