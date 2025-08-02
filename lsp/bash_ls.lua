local globals = require("globals")

return {
	cmd = { "bash-language-server", "start" },
	filetypes = { "bash", "sh" },
	root_markers = { ".git" },
	on_attach = globals.on_attach,
	capabilities = globals.capabilities,
}
