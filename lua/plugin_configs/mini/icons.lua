return {
	"echasnovski/mini.icons",
	config = function()
		require("mini.icons").setup {
			-- stylua: ignore start
			-- The "file", "extention", and "filetype" sections
			-- are ordered from Highest to Lowest Priority.
			file = {
				[".zshenv"] = { glyph = "󱆃" },
				[".zshrc"] =  { glyph = "󱆃" },

				[".gitignore"] =    { hl = "GitIconColor" },
				[".styluaignore"] = { glyph = "", hl = "LuaIconColor" },
				["init.lua"] =      { glyph = "", hl = "LuaIconColor" },

				[".editorconfig"] = { glyph = "", hl = "EditorconfigIconColor" },
				["README.md"] =     { glyph = "", hl = "TextFileIconColor" },
				LICENSE =           { hl = "LicenseIconColor" },

				viminfo = { glyph = "", hl = "VimIconColor" },
				vimrc =   { glyph = "", hl = "VimIconColor" },

				-- Have to settle for this in the meantime because I have plugins that rely on "MiniIcons.mock_nvim_web_devicons()"
				-- For more info: https://github.com/echasnovski/mini.nvim/issues/1893#issuecomment-3068354876
				["animations.conf"] =    { glyph = "", hl = "MiniIconsCyan" },
				["autostart.conf"] =     { glyph = "", hl = "MiniIconsCyan" },
				["decorations.conf"] =   { glyph = "", hl = "MiniIconsCyan" },
				["env_variables.conf"] = { glyph = "", hl = "MiniIconsCyan" },
				["input.conf"] =         { glyph = "", hl = "MiniIconsCyan" },
				["keybindings.conf"] =   { glyph = "", hl = "MiniIconsCyan" },
				["monitors.conf"] =      { glyph = "", hl = "MiniIconsCyan" },
				["other.conf"] =         { glyph = "", hl = "MiniIconsCyan" },
				["rules.conf"] =         { glyph = "", hl = "MiniIconsCyan" },
				["tiling.conf"] =        { glyph = "", hl = "MiniIconsCyan" },
				["variables.conf"] =     { glyph = "", hl = "MiniIconsCyan" },
				["hypridle.conf"] =      { glyph = "", hl = "MiniIconsCyan" },
				["hyprland.conf"] =      { glyph = "", hl = "MiniIconsCyan" },
				["hyprlock.conf"] =      { glyph = "", hl = "MiniIconsCyan" },
			},
			extension = {
				-- General Info
				text = { glyph = "", hl = "TextFileIconColor" },
				md =   { glyph = "", hl = "MarkdownIconColor" },

				-- Images
				gif =  { glyph = "", hl = "GifIconColor" },
				jpeg = { glyph = "", hl = "ImageIconColor" },
				jpg =  { glyph = "", hl = "ImageIconColor" },
				png =  { glyph = "", hl = "ImageIconColor" },
				webp = { glyph = "", hl = "ImageIconColor" },

				-- Videos
				avi =  { glyph = "", hl = "VideoIconColor" },
				mkv =  { glyph = "", hl = "VideoIconColor" },
				mp4 =  { glyph = "", hl = "VideoIconColor" },
				webm = { glyph = "", hl = "VideoIconColor" },

				-- Object Files
				o =  { glyph = "", hl = "BinaryFileIconColor" },
				so = { glyph = "", hl = "BinaryFileIconColor" },

				-- Header files for C and C++
				h = { glyph = "", hl = "HeaderFileIconColor" },

				-- Web Development
				html = { hl = "HTML_IconColor" },
				css =  { hl = "CSS_IconColor" },
				js =   { glyph = "", hl = "JS_IconColor" },

				-- Other Languages
				java = { hl = "JavaIconColor" },
				lua =  { hl = "LuaIconColor" },
				py =   { hl = "PythonIconColor" },

				-- Jupyter Notebooks
				ipynb = { glyph = "", hl = "JupyterIconColor" },

				-- Documents
				docx = { hl = "WordDocIconColor" },
				pdf =  { glyph = "", hl = "PDF_IconColor" },
				xlsx = { hl = "ExcelIconColor" },

				-- Data Serialization Formats
				ini =   { glyph = "", hl = "SettingsIconColor" },
				json =  { glyph = "" },
				jsonc = { glyph = "", hl = "JsonIconColor" },

				-- Databases
				db =      { glyph = "", hl = "SettingsIconColor" },
				sql =     { glyph = "", hl = "SettingsIconColor" },
				sqlite =  { glyph = "", hl = "SettingsIconColor" },
				sqlite3 = { glyph = "", hl = "SettingsIconColor" },

				-- Config Extensions
				cfg =  { glyph = "", hl = "SettingsIconColor" },
				conf = { glyph = "", hl = "SettingsIconColor" },
				rasi = { glyph = "", hl = "SettingsIconColor" },

				-- Logs
				log = { glyph = "", hl = "TextFileIconColor " },

				-- Compressed Files
				["7z"] = { glyph = "", hl = "CompressedFileIconColor" },
				rar =    { glyph = "", hl = "CompressedFileIconColor" },
				zip =    { glyph = "", hl = "CompressedFileIconColor" },

				-- Fonts
				ttf = { glyph = "", hl = "TextFileIconColor" },
				otf = { glyph = "", hl = "TextFileIconColor" },

				-- Other
				exe = { hl = "WindowsIconColor" },
				zsh = { glyph = "󱆃", hl = "ShellIconColor" },
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
