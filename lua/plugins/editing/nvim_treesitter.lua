local globals = require("globals")

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,

	-- On NixOS, prevent lazy.nvim from overriding/downloading over the Nix-provided plugin
	dir = globals.nixos and vim.fn.isdirectory(vim.fn.expand("/nix/store")) == 1 and (function()
		-- Find the nvim-treesitter store directory in runtimepath or nix store
		for _, path in ipairs(vim.api.nvim_list_runtime_paths()) do
			if path:match("nvim%-treesitter") or path:match("with%-all%-grammars") then
				return path
			end
		end
		return nil
	end)() or nil,

	build = function()
		if not globals.nixos then
			vim.cmd("TSUpdate")
		end
	end,

	init = function()
		if globals.nixos then
			-- Re-inject Nix store parser paths if lazy.nvim removed them from runtimepath
			local nix_store_parsers = vim.fn.glob("/nix/store/*-vimplugin-nvim-treesitter-*/parser", true, true)
			for _, parser_path in ipairs(nix_store_parsers) do
				if vim.fn.isdirectory(parser_path) == 1 then
					vim.opt.rtp:append(vim.fn.fnamemodify(parser_path, ":h"))
				end
			end
		end
	end,

	config = function()
		local ts = require("nvim-treesitter")

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("TSAutoInstallAndHighlight", { clear = true }),
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

				-- Check if parser is already installed/loadable
				local has_parser = pcall(vim.treesitter.language.add, lang)

				-- On other OS: compile/install missing parsers dynamically
				-- On NixOS: skip compilation; Nix handles parser installations
				if not has_parser and not globals.nixos then
					ts.install { lang }
				end

				-- Start native Neovim Tree-sitter highlighting
				pcall(vim.treesitter.start, args.buf, lang)
			end,
		})
	end,
}
