-- Basic autocommands
local augroup = vim.api.nvim_create_augroup("UserConfig", {})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Obsidian File Links
-- Strip out [[ and ]] and search recursively for files in subfolders
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "markdown",
	callback = function()
		vim.keymap.set("n", "gf", function()
			local line = vim.api.nvim_get_current_line()
			local raw_link = line:match("%[%[(.-)%]%]") -- Find text inside [[ ]]

			if raw_link then
				-- Splits the string at '|' if it exists and takes the left side
				local link = vim.split(raw_link, "|", { plain = true })[1]

				-- If the link doesn't end in .md, add it automatically
				if not link:match("%.md$") then
					link = link .. ".md"
				end

				-- Extract just the filename (in case the link contains a partial path)
				local filename = vim.fs.basename(link)

				-- Search recursively downward from your project root (CWD)
				local found = vim.fs.find(filename, { path = vim.fn.getcwd(), upward = false, type = "file" })

				if found[1] then
					-- If found anywhere in subfolders, open it!
					vim.cmd("edit " .. vim.fn.fnameescape(found[1]))
				else
					-- If the file doesn't exist anywhere, create it right next to the current file
					local current_dir = vim.fn.expand("%:p:h")
					local new_file = vim.fs.joinpath(current_dir, link)

					-- Ensure subfolders exist if the link explicitly typed one out
					vim.fn.mkdir(vim.fs.dirname(new_file), "p")
					vim.cmd("edit " .. vim.fn.fnameescape(new_file))
				end
			else
				-- Fall back to standard gf behavior if it's not an obsidian link
				vim.cmd("normal! gf")
			end
		end, { buffer = true, desc = "Follow Markdown Link" })
	end,
})

-- Obsidian image/web links
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "markdown",
	callback = function()
		vim.keymap.set("n", "gx", function()
			-- stylua: ignore start
			local line = vim.api.nvim_get_current_line()
			local path = line:match("%!%[.-%]%((.-)%)")           -- Check for a standard markdown image: ![alt](path)
			local web_url = line:match("%[.-%]%((https?://.-)%)") -- Check for a standard markdown web link: [text](url)
			-- stylua: ignore end

			if path then
				-- Get the clean filename without any subfolder prefixes (e.g., "photo.png")
				local filename = vim.fs.basename(path)

				-- Route directly to your absolute Vault root path + Images subdirectory
				local vault_root = vim.fn.getcwd()
				local absolute_path = vim.fs.normalize(vim.fs.joinpath(vault_root, "Images", filename))

				vim.fn.jobstart({ "xdg-open", absolute_path }, { detach = true })
				return
			elseif web_url then
				vim.fn.jobstart({ "xdg-open", web_url }, { detach = true })
				return
			end

			vim.cmd("normal! gx")
		end, { buffer = true, desc = "Open image/web link under cursor in system viewer" })
	end,
})
