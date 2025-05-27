return {
	{
		-- Package Manager for LSPs, DAPs, Linters, and Formatters
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup {
				ui = {
					icons = {
						package_pending = " ",
						package_installed = " ",
						package_uninstalled = " ",
					},
				},
			}
		end,
	},
	-- stylua: ignore start
	{
		-- To auto-install Mason packages
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup {
				ensure_installed = {
					-- LSPs
					"lua-language-server",  -- Lua
					"clangd",               -- C/C++
					"bash-language-server", -- Bash
					"pyright",              -- Python

					-- DAPs
					"codelldb",             -- C/C++
					"debugpy",              -- Python

					-- Linters
					"shellcheck",           -- Bash

					-- Formatters
					"stylua",               -- Lua
					"shfmt",                -- Bash
				},
				auto_update = true,
			}
		end,
	},
	-- stylua: ignore end

	require("plugin_configs.mason_nvim.lsp"),
	require("plugin_configs.mason_nvim.dap"),
	require("plugin_configs.mason_nvim.linters"),
	require("plugin_configs.mason_nvim.formatters"),
}
