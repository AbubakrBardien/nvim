return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local render_markdown = require("render-markdown")

		render_markdown.setup {
			enabled = false,
			-- Custom highlight overrides natively injected into render-markdown
			on = {
				attach = function()
					-- Change Markdown Links to classic Obsidian Blue
					-- stylua: ignore start
					vim.api.nvim_set_hl(0, "@markup.link.label.markdown_inline", { fg = "#4a98ff" })
					vim.api.nvim_set_hl(0, "@markup.link.url.markdown_inline",   { fg = "#4a98ff", underline = true })
					-- stylua: ignore end

					-- Create a standalone highlight group for your bold+italic pop
					vim.api.nvim_set_hl(0, "MarkdownBoldItalicGradient", {
						fg = "#8ac8ff",
						bold = true,
						italic = true,
					})

					-- Tell the Treesitter buffer query to map combined styles to your new color group
					vim.fn.matchadd("MarkdownBoldItalicGradient", [[\v\*\*\*([^*]+)\*\*\*]])
					vim.fn.matchadd("MarkdownBoldItalicGradient", [[\v___([^_]+)___]])
				end,
			},
		}

		vim.keymap.set("n", "<leader>rm", render_markdown.toggle, { desc = "Render Markdown" })
	end,
}
