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
			-- Find text inside [[ ]]
			local raw_link = line:match("%[%[(.-)%]%]")

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

-- Obsidian image links
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = "markdown",
	callback = function()
		vim.keymap.set("n", "gx", function()
			local line = vim.api.nvim_get_current_line()

			-- 1. Check for standard markdown images: ![alt](path)
			local path = line:match("%!%[.-%]%((.-)%)")

			-- 2. Check for Obsidian wiki-link images: ![[path]] or ![[path|300]]
			if not path then
				local wiki_path = line:match("%!%[%[(.-)%]%]")
				if wiki_path then
					-- Strip out any Obsidian display sizing like |300 if it exists
					path = vim.split(wiki_path, "|", { plain = true })[1]
				end
			end

			if path then
				-- Get the clean filename without any subfolder prefixes (e.g., "photo.png")
				local filename = vim.fs.basename(path)

				-- Route directly to your absolute Vault root path + Images subdirectory
				local vault_root = vim.fn.getcwd()
				local absolute_path = vim.fs.normalize(vim.fs.joinpath(vault_root, "Images", filename))

				vim.fn.jobstart({ "xdg-open", absolute_path }, { detach = true })
			else
				vim.cmd("normal! gx")
			end
		end, { buffer = true, desc = "Open image under cursor in system viewer" })
	end,
})
