local globals = require("globals")

return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		"requirements.txt",
		".git",
	},
	on_attach = globals.on_attach,
	capabilities = globals.capabilities,
}
