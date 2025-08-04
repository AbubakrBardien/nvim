vim.g.mapleader = " "

---- Line Numbering ----
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 2

---- Cursor Highlighting --
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

---- Indenting ----
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

---- Spell-check ----
vim.opt.spell = false -- toggle when needed
vim.opt.spelllang = { "en_gb" }

---- Other Options ----
-- stylua: ignore
vim.opt.guicursor = ""            -- To make the cursor stay the same when in insert mode
vim.opt.clipboard = "unnamedplus" -- Makes vim use the system clipboard
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.signcolumn = "yes:1"
vim.opt.wrap = false

----- Plugin Options -----

---- Floterm ----
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9

---- Create Folds ----
vim.o.foldcolumn = "1"
vim.o.foldlevelstart = 99 -- Start with all folds open
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
