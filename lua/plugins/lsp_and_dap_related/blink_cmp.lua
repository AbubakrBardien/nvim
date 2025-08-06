return {
	{
		"saghen/blink.compat",
		config = true,
	},
	{
		"saghen/blink.cmp", -- Auto-Completion plugin
		dependencies = {
			"rafamadriz/friendly-snippets",
			"bydlw98/cmp-env",
			"echasnovski/mini.icons",
		},

		-- Can't use the "enabled = function() .. end," logic to enable plugin based on the filetype, even though the documentation says you can. Trust me, I've tried

		config = function()
			require("blink.cmp").setup {
				appearance = {
					use_nvim_cmp_as_default = true, -- will be removed in future update
					nerd_font_variant = "mono",
				},

				sources = {
					default = function()
						if vim.bo.filetype == "text" then
							return { "buffer", "path" }
						elseif vim.bo.filetype == "markdown" then
							return { "buffer", "path", "snippets", "env" }
						else
							return { "path", "snippets", "env", "lsp" }
						end
					end,

					providers = {
						buffer = {
							min_keyword_length = 5,
						},
						env = {
							name = "env",
							module = "blink.compat.source",
							min_keyword_length = 5,
						},
					},
				},

				signature = { enabled = true },

				completion = {
					menu = {
						scrollbar = false,
						draw = {
							columns = { { "kind_icon", "label", "source_name", gap = 1 } },
							-- columns = { { "label", gap = 1 } },
							-- columns = function()
							-- 	if vim.bo.filetype == "text" then
							-- 		return { { "label", gap = 1 } }
							-- 	else
							-- 		return { { "kind_icon", "label", "source_name", gap = 1 } }
							-- 	end
							-- end,
							components = {
								-- Makes "Blink.cmp" use icons from "Mini.icons"
								kind_icon = {
									ellipsis = false,
									text = function(ctx)
										local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
										return kind_icon
									end,
									highlight = function(ctx)
										local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
										return hl
									end,
								},

								label = { width = { fill = true, max = 50 } },
							},
						},
					},
					documentation = {
						auto_show = true,
						auto_show_delay_ms = 500,
					},
				},

				keymap = {
					preset = "enter",
					["<C-space>"] = { "show", "hide", "fallback" },
					["<S-Left>"] = { "scroll_documentation_up", "fallback" },
					["<S-Right>"] = { "scroll_documentation_down", "fallback" },

					["<C-e>"] = {},
					["<C-p>"] = {},
					["<C-n>"] = {},
				},
			}
		end,
	},
}
