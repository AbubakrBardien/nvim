return {
	"luukvbaal/statuscol.nvim",
	config = function()
		local builtin = require("statuscol.builtin")
		require("statuscol").setup {
			relculright = true, -- whether to right-align the cursor line number with 'relativenumber' set
			segments = {
				-- Diagnostic Signs
				{
					text = { "%s" },
					-- click = "v:lua.ScSa", (makes the segmant clickable)
					colwidth = 2,
				},

				-- Line Numbers
				{
					text = { builtin.lnumfunc, " " },
					condition = { true, builtin.not_empty },
					click = "v:lua.ScLa",
				},

				-- Code Folds
				{
					text = { builtin.foldfunc, " " },
					hl = "FoldColumn",
					wrap = true,
					colwidth = 1,
					-- click = "v:lua.ScFa", (makes the segmant clickable)
				},
			},
		}
	end,
}
