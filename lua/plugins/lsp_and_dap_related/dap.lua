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

			------ Keymaps ------  (I couldn't get Local Keymaps to work)

			local dap = require("dap")
			local dapui = require("dapui")

			-- stylua: ignore start
			vim.keymap.set("n", "<leader>dc", dap.continue,  { desc = "DAP: Continue" })
			vim.keymap.set("n", "<leader>n",  dap.step_over, { desc = "DAP: Step Over" })
			vim.keymap.set("n", "<leader>db", dap.step_back, { desc = "DAP: Step Back" })
			vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "DAP: Step Into" })
			vim.keymap.set("n", "<leader>do", dap.step_out,  { desc = "DAP: Step Out" })
			-- stylua: ignore end

			vim.keymap.set("n", "<leader>dt", function()
				dap.terminate()
				dapui.close()
			end, { desc = "DAP: Terminate" })

			vim.keymap.set("n", "<leader>b", function()
				if vim.api.nvim_get_current_line() ~= "" then
					dap.toggle_breakpoint()
				end
			end, { desc = "DAP: Toggle Breakpoint" })

			vim.keymap.set("n", "<leader>B", function()
				if vim.api.nvim_get_current_line() ~= "" then
					vim.ui.input({ prompt = "Enter Condition:" }, function(condition)
						dap.toggle_breakpoint(condition)
					end)
				end
			end, { desc = "DAP: Toggle Conditional Breakpoint" })

			vim.keymap.set("n", "<Space>/", function()
				---@diagnostic disable-next-line: missing-fields
				dapui.eval(nil, { enter = true })
			end, { desc = "DAPUI: Eval var under cursor" })

			---------------------
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
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			-- auto-generate the debug windows/elements
			-- stylua: ignore start
			dap.listeners.before.attach.dapui_config =           function() dapui.open()  end
			dap.listeners.before.launch.dapui_config =           function() dapui.open()  end
			dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
			dap.listeners.before.event_exited.dapui_config =     function() dapui.close() end
			-- stylua: ignore end

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
