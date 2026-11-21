return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main", -- Keep since version "nvim-treesitter" v0.10 is incompatible with nvim v0.12+
	lazy = false,
	virtual = true, -- The plugin and parsers come from Nix. Lazy only runs init/config

	init = function()
		-- Re-inject Nix store parser paths if lazy.nvim removed them from runtimepath
		local nix_store_parsers = vim.fn.glob("/nix/store/*-vimplugin-nvim-treesitter-*/parser", true, true)
		for _, parser_path in ipairs(nix_store_parsers) do
			if vim.fn.isdirectory(parser_path) == 1 then
				vim.opt.rtp:append(vim.fn.fnamemodify(parser_path, ":h"))
			end
		end
	end,

	config = function()
		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("TSHighlight", { clear = true }),
			callback = function(args)
				local ft = vim.bo[args.buf].filetype
				if ft == "" then
					return
				end

				-- Map filetype to canonical Tree-sitter language name
				local lang = vim.treesitter.language.get_lang(ft) or ft

				-- Performance Guardrail: Skip giant files (> 100 KB)
				local max_filesize = 100 * 1024
				local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(args.buf))
				if ok and stats and stats.size > max_filesize then
					return
				end

				-- Start native Neovim Tree-sitter highlighting
				pcall(vim.treesitter.start, args.buf, lang)
			end,
		})
	end,
}
