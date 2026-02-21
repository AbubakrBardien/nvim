local globals = require("globals")

return {
	cmd = { "rust-analyzer" },
	filetypes = { "rust" },
	root_markers = {
		"Cargo.toml",
		"rust-project.json",
		".git",
	},
	on_attach = globals.on_attach,
	capabilities = globals.capabilities,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = true,
			check = { command = "clippy" },
		},
	},
}
