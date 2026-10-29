return {
	"kevinhwang91/nvim-hlslens",
	branch = "main", -- for highlighting matches when using the ":g/pattern/command" command
	config = function()
		require("hlslens").setup {}
		vim.opt.shortmess:append("S") -- Removing Search Count at the bottom right because this plugin already shows that info
	end,
}
