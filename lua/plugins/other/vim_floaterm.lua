return {
	"voldikss/vim-floaterm",
	config = function()
		-- stylua: ignore start
		vim.keymap.set("n", "<C-.>", ":FloatermNew<CR>",    { desc = "Open new terminal window" })
		vim.keymap.set("n", "<C-/>", ":FloatermToggle<CR>", { desc = "Toggle terminal window" })
		vim.keymap.set("n", "<C-'>", ":FloatermKill<CR>",   { desc = "Kill terminal window" })
		vim.keymap.set("t", "<C-;>", "<C-\\><C-n>",         { desc = "Exit terminal mode", silent = true })
		-- stylua: ignore end
	end,
}
