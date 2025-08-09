local globals = require("globals")

return {
	cmd = { "clangd" },
	filetypes = { "c", "cpp" },
	root_markers = {
		"compile_commands.json",
		"compile_flags.txt",
		".clang-tidy",
		".clang-format",
		".git",
	},
	on_attach = globals.on_attach,
	capabilities = globals.capabilities,
}
