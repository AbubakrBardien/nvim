local globals = require("globals")

return {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = {
		".stylua.toml",
		"stylua.toml",
		".git",
	},
	on_attach = globals.on_attach,
	capabilities = globals.capabilities,
}
