return {
	{
		-- Tool to bridge the gap between "mason.nvim" with "nvim-dap"
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("mason-nvim-dap").setup {
				handlers = {}, -- sets up DAP configurations so that I don't have to do it manually
			}
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text", -- shows variable values right next to the variables
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()

			-- auto-generate the debug windows/elements
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			require("nvim-dap-virtual-text").setup {
				virt_text_pos = "eol", -- end of line
			}
		end,
	},

	vim.api.nvim_set_hl(0, "BreakpointSymbol", { fg = "#de525d", bg = "NONE" }),
	vim.api.nvim_set_hl(0, "DapStopped", { fg = "#6ed470", bg = "NONE" }),

	vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "BreakpointSymbol" }),
	vim.fn.sign_define("DapBreakpointCondition", { text = " ", texthl = "BreakpointSymbol" }),
	vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped" }),
}
