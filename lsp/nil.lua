local globals = require("globals")

return {
	cmd = { "nil" },
	filetypes = { "nix" },
	root_markers = {
		"flake.nix",
		".git",
	},
	on_attach = globals.on_attach,
	capabilities = globals.capabilities,
}
