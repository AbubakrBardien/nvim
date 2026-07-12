local globals = require("globals")

-- Cursor Highlights
vim.api.nvim_set_hl(0, "CursorLine", { bg = globals.get_hl_color("CursorLine") })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = globals.get_hl_color("CursorColumn") })

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", { link = "NONE" })
