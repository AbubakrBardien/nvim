return {
	"kevinhwang91/nvim-hlslens",
	config = function()
		require("hlslens").setup {}
		vim.opt.shortmess:append("S") -- Removing Search Count at the bottom right because this plugin already shows that info
	end,
}
