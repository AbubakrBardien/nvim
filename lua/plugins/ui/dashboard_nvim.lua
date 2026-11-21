---@diagnostic disable: unused-local

local art1 = {
	"",
	"",
	"",
	"                                                                     ",
	"       ████ ██████           █████      ██                     ",
	"      ███████████             █████                             ",
	"      █████████ ███████████████████ ███   ███████████   ",
	"     █████████  ███    █████████████ █████ ██████████████   ",
	"    █████████ ██████████ █████████ █████ █████ ████ █████   ",
	"  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
	" ██████  █████████████████████ ████ █████ █████ ████ ██████ ",
	"",
	"",
	"",
}
local art2 = {
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"",
	"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
	"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
	"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
	"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
	"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
	"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
	"",
	"",
	"",
}
local art3 = {
	"",
	"",
	"",
	"⠀⢀⣴⣦⠀⠀⠀⠀⢰⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⣰⣿⣿⣿⣷⡀⠀⠀⢸⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⣿⣿⣿⣿⣿⣿⣄⠀⢸⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
	"⣿⣿⣿⠈⢿⣿⣿⣦⢸⣿⣿⡇⠀⣠⠴⠒⠢⣄⠀⠀⣠⠴⠲⠦⣄⠐⣶⣆⠀⠀⢀⣶⡖⢰⣶⠀⢰⣶⣴⡶⣶⣆⣴⡶⣶⣶⡄",
	"⣿⣿⣿⠀⠀⠻⣿⣿⣿⣿⣿⡇⢸⣁⣀⣀⣀⣘⡆⣼⠁⠀⠀⠀⠘⡇⠹⣿⡄⠀⣼⡿⠀⢸⣿⠀⢸⣿⠁⠀⢸⣿⡏⠀⠀⣿⣿",
	"⠹⣿⣿⠀⠀⠀⠙⣿⣿⣿⡿⠃⢸⡀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⢀⡏⠀⢻⣿⣸⣿⠁⠀⢸⣿⠀⢸⣿⠀⠀⢸⣿⡇⠀⠀⣿⣿",
	"⠀⠈⠻⠀⠀⠀⠀⠈⠿⠋⠀⠀⠈⠳⢤⣀⣠⠴⠀⠈⠧⣄⣀⡠⠞⠁⠀⠀⠿⠿⠃⠀⠀⢸⣿⠀⢸⣿⠀⠀⠸⣿⡇⠀⠀⣿⡿",
}

local shortcut_fmt = "     %s"

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup {
			theme = "doom",
			config = {
				header = art2,
				center = {
					-- stylua: ignore start
					{ icon = " ", desc = "Lazy Menu",    action = "Lazy" },
					{ icon = " ", desc = "Nvim Configs", action = "Telescope find_files cwd=" .. vim.fn.stdpath("config") },
					{ icon = " ", desc = "Find Files",   action = "Telescope find_files", key = "Space ff", key_format = shortcut_fmt },
					{ icon = "󰚰 ", desc = "Recent Files", action = "Telescope oldfiles",   key = "Space fr", key_format = shortcut_fmt },
					{ icon = " ", desc = "Sessions",     action = "Telescope persisted",  key = "Space fs", key_format = shortcut_fmt },
					-- stylua: ignore end
				},
			},
			shortcut_type = "number",
		}

		-- Highlights
		vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#8dbf6d" })
	end,
}
