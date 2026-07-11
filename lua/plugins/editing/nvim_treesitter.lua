return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local ts = require("nvim-treesitter")

		-- Enable native Neovim highlighting safely via autocommand
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("TSAutoInstallAndHighlight", { clear = true }),
			callback = function(args)
				-- Guardrail: Don't highlight giant files to save performance
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
				if ok and stats and stats.size > max_filesize then
					return
				end

				-- stylua: ignore start
				local lang = vim.bo[args.buf].filetype
				if lang == "" then return end
				-- stylua: ignore end

				-- Try to query Neovim's native language inspector
				-- If it's a valid language but no parser is loaded, auto-install it!
				local has_parser = pcall(vim.treesitter.language.add, lang)

				-- Run asynchronously so it doesn't freeze your UI while compiling
				if not has_parser then
					ts.install(lang)
				end

				-- Safely attempt to start Tree-sitter.
				-- If a parser isn't installed for the filetype, it won't crash your editor.
				pcall(vim.treesitter.start, args.buf)
			end,
		})
	end,
}
