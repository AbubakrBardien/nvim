-- Constants
-- stylua: ignore start
local ZSH =         { glyph = "󱆃", hl = "MiniIconsGreen" }
local LUA =         { glyph = "", hl = "LuaIconColor" }
local VIM =         { glyph = "", hl = "VimIconColor" }
local HYPRLAND =    { glyph = "", hl = "MiniIconsCyan" }
local IMAGE =       { glyph = "", hl = "ImageIconColor" }
local VIDEO =       { glyph = "", hl = "VideoIconColor" }
local BINARY_FILE = { glyph = "", hl = "BinaryFileIconColor" }
local SETTINGS =    { glyph = "", hl = "SettingsIconColor" }
local DATABASE =    { glyph = "", hl = "SettingsIconColor" }
local COMPRESSED =  { glyph = "", hl = "CompressedFileIconColor" }
local FONT =        { glyph = "", hl = "TextFileIconColor" }
-- stylua: ignore start

return {
	"echasnovski/mini.icons",
	config = function()
		require("mini.icons").setup {
			-- stylua: ignore start
			-- The "file", "extention", and "filetype" sections
			-- are ordered from Highest to Lowest Priority.
			file = {
				[".zshenv"] = ZSH,
				[".zshrc"] = ZSH,

				[".gitignore"] = { hl = "GitIconColor" },
				[".styluaignore"] = LUA,
				["init.lua"] = LUA,

				[".editorconfig"] = { glyph = "", hl = "EditorconfigIconColor" },
				["README.md"] =     { glyph = "", hl = "TextFileIconColor" },
				LICENSE =           { hl = "LicenseIconColor" },

				viminfo = VIM,
				vimrc = VIM,

				-- Have to settle for this in the meantime because I have plugins that rely on "MiniIcons.mock_nvim_web_devicons()"
				-- For more info: https://github.com/echasnovski/mini.nvim/issues/1893#issuecomment-3068354876
				["animations.conf"] = HYPRLAND,
				["autostart.conf"] = HYPRLAND,
				["decorations.conf"] = HYPRLAND,
				["env_variables.conf"] = HYPRLAND,
				["input.conf"] = HYPRLAND,
				["keybindings.conf"] = HYPRLAND,
				["monitors.conf"] = HYPRLAND,
				["other.conf"] = HYPRLAND,
				["rules.conf"] = HYPRLAND,
				["tiling.conf"] = HYPRLAND,
				["variables.conf"] = HYPRLAND,
				["hypridle.conf"] = HYPRLAND,
				["hyprland.conf"] = HYPRLAND,
				["hyprlock.conf"] = HYPRLAND,
			},
			extension = {
				-- General Info
				text = { glyph = "", hl = "TextFileIconColor" },
				md =   { glyph = "", hl = "MarkdownIconColor" },

				-- Images
				gif =  { glyph = "", hl = "GifIconColor" },
				jpeg = IMAGE,
				jpg = IMAGE,
				png = IMAGE,
				webp = IMAGE,

				-- Videos
				avi = VIDEO,
				mkv = VIDEO,
				mp4 = VIDEO,
				webm = VIDEO,

				-- Object Files
				o = BINARY_FILE,
				so = BINARY_FILE,

				-- Header files for C and C++
				h = { glyph = "", hl = "HeaderFileIconColor" },

				-- Web Development
				html = { hl = "HTML_IconColor" },
				css =  { hl = "CSS_IconColor" },
				js =   { glyph = "", hl = "JS_IconColor" },

				-- Other Languages
				java = { hl = "JavaIconColor" },
				lua = LUA,
				py = { hl = "PythonIconColor" },

				-- Jupyter Notebooks
				ipynb = { glyph = "", hl = "JupyterIconColor" },

				-- Documents
				docx = { hl = "WordDocIconColor" },
				pdf =  { glyph = "", hl = "PDF_IconColor" },
				xlsx = { hl = "ExcelIconColor" },

				-- Data Serialization Formats
				ini = SETTINGS,
				json =  { glyph = "" },
				jsonc = { glyph = "", hl = "JsonIconColor" },

				-- Databases
				db = DATABASE,
				sql = DATABASE,
				sqlite = DATABASE,
				sqlite3 = DATABASE,

				-- Config Extensions
				cfg = SETTINGS,
				conf = SETTINGS,
				rasi = SETTINGS,

				-- Logs
				log = { glyph = "", hl = "TextFileIconColor " },

				-- Compressed Files
				["7z"] = COMPRESSED,
				rar = COMPRESSED,
				zip = COMPRESSED,

				-- Fonts
				ttf = FONT,
				otf = FONT,

				-- Other
				exe = { hl = "WindowsIconColor" },
				zsh = ZSH,
			},
			filetype = {
				sh =      { glyph = "", hl = "ShellIconColor" },
				systemd = { hl = "LinuxIconColor" },
			},
			lsp = {
				["function"] = { glyph = "" },
				field =        { glyph = "" },
				property =     { glyph = "" },
				text =         { glyph = "󰉿" },
				variable =     { hl = "MiniIconsGreen" },
				interface =    { glyph = "" },
			},
			default = {
				file = { glyph = "", hl = "TextFileIconColor" },
			},
			-- stylua: ignore end
		}
		MiniIcons.mock_nvim_web_devicons()
	end,
}
