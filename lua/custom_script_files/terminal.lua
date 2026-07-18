local M = {}

local state = {
	buf = -1,
	win = -1,
}

function M.toggle()
	-- If the window is valid and open, hide it
	if vim.api.nvim_win_is_valid(state.win) then
		vim.api.nvim_win_hide(state.win)
		return
	end

	-- Determine layout size (centered, taking up 80% width and 75% height)
	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.75)
	local col = math.floor((vim.o.columns - width) / 2)
	local row = math.floor((vim.o.lines - height) / 2)

	-- Create or reuse the terminal buffer
	if not vim.api.nvim_buf_is_valid(state.buf) then
		state.buf = vim.api.nvim_create_buf(false, true)
	end

	-- Open the elegant floating window
	state.win = vim.api.nvim_open_win(state.buf, true, {
		relative = "editor",
		width = width,
		height = height,
		col = col,
		row = row,
		style = "minimal",
		border = "rounded", -- Modern clean borders
	})

	-- Start a real native terminal session inside if it's a fresh buffer
	if vim.bo[state.buf].buftype ~= "terminal" then
		vim.cmd("terminal")
	end

	-- Automatically drop straight into insert mode inside the shell
	vim.cmd("startinsert")
end

function M.kill()
	if vim.api.nvim_win_is_valid(state.win) then
		vim.api.nvim_win_hide(state.win)
	end
	if vim.api.nvim_buf_is_valid(state.buf) then
		vim.api.nvim_buf_delete(state.buf, { force = true })
	end
	state.win = -1
	state.buf = -1
end

return M
