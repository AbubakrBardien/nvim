local globals = require("globals")

--- Install Lazy.nvim if not already installed ---
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local repo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
	--- Loading plugins ---
	spec = { import = "plugins" },

	--- Lazy.nvim config ---
	defaults = {
		version = "*",
	},
	install = { colorscheme = { globals.colorscheme } },
	change_detection = { notify = false },
	checker = {
		enabled = true,
		notify = false,
		frequency = 86400, -- Check daily (every 86400 seconds)
	},
}
