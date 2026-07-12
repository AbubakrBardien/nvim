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
	pattern = "markdown",
	callback = function()
		vim.keymap.set("n", "gf", function()
			local line = vim.api.nvim_get_current_line()
			-- Find text inside [[ ]]
			local raw_link = line:match("%[%[(.-)%]%]")

			if raw_link then
				-- FIX: Handle Obsidian alias pipes [[Target File|Display Text]]
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
