return {
	-- Color Code Highlighter
	"norcalli/nvim-colorizer.lua",
	event = { "BufWritePost" }, -- execute on save
	config = function()
		local nvim_colorizer = require("colorizer")
		vim.keymap.set("n", "<leader>cr", function()
			nvim_colorizer.reload_all_buffers()
		end, { desc = "Reload Colorizer plugin" })
	end,
}
