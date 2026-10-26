return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile", "BufWritePost" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			sh = { "shellcheck" }, -- Needed for "bash-language-server"
			nix = { "statix" },
			-- cpp is handled below, only when a CPPLINT.cfg exists
		}

		local function has_cpplint_cfg(bufnr)
			local name = vim.api.nvim_buf_get_name(bufnr)
			if name == "" then
				return false
			end
			return vim.fs.find("CPPLINT.cfg", { path = vim.fs.dirname(name), upward = true })[1] ~= nil
		end

		vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
			callback = function(args)
				if vim.bo[args.buf].filetype == "cpp" then
					if has_cpplint_cfg(args.buf) then
						lint.try_lint("cpplint")
					end
					return
				end
				lint.try_lint()
			end,
		})
	end,
}
