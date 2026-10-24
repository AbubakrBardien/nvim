return {
	"olimorris/persisted.nvim",
	config = function()
		local persisted = require("persisted")

		-- Is the cwd inside a git repo? (.git can be a file in worktrees; this handles both)
		local in_git_repo = vim.fs.root(vim.fn.getcwd(), ".git") ~= nil

		-- True if at least one real file is open (dashboard buffers are 'nofile')
		local function has_real_buffer()
			for _, buf in ipairs(vim.api.nvim_list_bufs()) do
				-- stylua: ignore start
				if  vim.api.nvim_buf_is_loaded(buf)
					and vim.bo[buf].buflisted
					and vim.bo[buf].buftype == ""
					and vim.api.nvim_buf_get_name(buf) ~= ""
				then
					return true
				end
				-- stylua: ignore end
			end
			return false
		end

		persisted.setup {
			use_git_branch = true,
			should_save = function()
				return in_git_repo and has_real_buffer()
			end,
		}

		if in_git_repo then
			persisted.start()
		end
	end,
}
