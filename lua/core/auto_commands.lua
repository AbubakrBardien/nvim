-- Helper function to quickly create or fetch augroups with clearing enabled by default
local function augroup(name)
	return vim.api.nvim_create_augroup("custom_" .. name, { clear = true })
end

local ui_group = augroup("ui")
local ft_group = augroup("filetypes")
local nav_group = augroup("navigation")

-----------------------------------------------------------------------

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = ui_group,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Show Cursorline only in active windows (ignores floating windows)
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	group = ui_group,
	callback = function()
		local win_config = vim.api.nvim_win_get_config(0)
		if win_config.relative ~= "" then
			return
		end
		vim.opt_local.cursorline = true
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	group = ui_group,
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

-----------------------------------------------------------------------

-- Open help in vertical split
vim.api.nvim_create_autocmd("FileType", {
	group = ft_group,
	pattern = "help",
	command = "wincmd H",
})

-- Syntax Highlighting for dotenv files
vim.api.nvim_create_autocmd("BufRead", {
	group = ft_group,
	pattern = { ".env", ".env.*" },
	callback = function()
		vim.bo.filetype = "dosini"
	end,
})

-- No auto continue comments on new line
vim.api.nvim_create_autocmd("FileType", {
	group = ft_group,
	callback = function()
		vim.opt_local.formatoptions:remove { "c", "r", "o" }
	end,
})

-----------------------------------------------------------------------

-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	group = nav_group,
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			-- defer centering slightly so it's applied after render
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
	end,
})
