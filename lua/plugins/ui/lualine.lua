return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-mini/mini.icons" },
	config = function()
		local globals = require("globals")

		-- Based on the Material theme provided by lualine.nvim
		local colors = {
			fg = "#eeffff",
			bg = "#263238",
			blue = "#96b8ff",
			green = "#91d67c",
			purple = "#c792ea",
			red1 = "#f07178",
			red2 = "#ff5370",
			orange = "#D8B576",
			grey1 = "#314549",
			grey2 = globals.get_hl_color("StatusLineNC") or globals.get_hl_color("Normal"),
			grey3 = "#34383b", -- "#3a3f42",
		}

		local custom_theme = {
			normal = {
				a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
				b = { fg = colors.blue, bg = colors.grey3, gui = "bold" },
				c = { fg = colors.fg, bg = colors.grey2 },
			},
			insert = {
				a = { fg = colors.bg, bg = colors.green, gui = "bold" },
				b = { fg = colors.green, bg = colors.grey3, gui = "bold" },
			},
			visual = {
				a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
				b = { fg = colors.purple, bg = colors.grey3, gui = "bold" },
			},
			replace = {
				a = { fg = colors.bg, bg = colors.red1, gui = "bold" },
				b = { fg = colors.red1, bg = colors.grey3, gui = "bold" },
			},
			command = {
				a = { fg = colors.bg, bg = colors.orange, gui = "bold" },
				b = { fg = colors.orange, bg = colors.grey3, gui = "bold" },
			},
			terminal = {
				a = { fg = colors.bg, bg = colors.green, gui = "bold" },
				b = { fg = colors.orange, bg = colors.grey3, gui = "bold" },
			},
			inactive = {
				a = { fg = colors.fg, bg = colors.bg, gui = "bold" },
				b = { fg = colors.fg, bg = colors.bg },
				c = { fg = colors.fg, bg = colors.grey2 },
			},
		}

		local function active_lsp()
			local clients = vim.lsp.get_clients { bufnr = 0 }

			if next(clients) == nil then
				return ""
			end

			local c = {}
			for _, client in ipairs(clients) do
				table.insert(c, client.name)
			end

			return " " .. table.concat(c, ", ")
		end

		require("lualine").setup {
			options = {
				globalstatus = true,
				theme = custom_theme,
				always_divide_middle = false,

				ignore_focus = { "NvimTree", "TelescopePrompt", "lazy", "mason" },
				disabled_filetypes = { "dashboard" },

				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "filetype", "filename" },
				lualine_x = { "diagnostics" },
				lualine_y = { active_lsp },
				lualine_z = { "progress" },
			},
		}
	end,
}
