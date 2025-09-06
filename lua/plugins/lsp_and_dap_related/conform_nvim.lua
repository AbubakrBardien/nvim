local function default_options(config_file, args)
	return function()
		local bufnr = vim.api.nvim_get_current_buf()
		local current_file = vim.api.nvim_buf_get_name(bufnr)
		local start_dir = vim.fs.dirname(current_file)

		local function traverse_parent_dir(file, start_path)
			return vim.fs.find(file, { path = start_path, limit = 1, upward = true })[1]
		end

		local config_file_path = traverse_parent_dir(config_file, start_dir)
		local config_file_exists = config_file_path ~= nil

		if config_file_exists then
			return { "-" }
		else
			return vim.list_extend(args, { "-" })
		end
	end
end

return {
	"stevearc/conform.nvim",
	lazy = false,
	config = function()
		local conform = require("conform")
		conform.setup {
			formatters_by_ft = {
				lua = { "stylua_custom" },
				sh = { "shfmt" },
				c = { "clang_format_custom" },
				cpp = { "clang_format_custom" },
			},
			format_on_save = {
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		}

		conform.formatters["stylua_custom"] = {
			command = "stylua",
			args = default_options("stylua.toml", {
				"--config-path",
				vim.fn.stdpath("config") .. "/lua/formatter_configs/stylua.toml",
			}),
		}

		conform.formatters["clang_format_custom"] = {
			command = "clang-format",
			args = default_options(".clang-format", {
				"--style=file:" .. vim.fn.stdpath("config") .. "/lua/formatter_configs/.clang-format",
			}),
		}
	end,
}
