local g = vim.g
local opt = vim.opt
local o = vim.o

g.mapleader = " "

---- Line Numbering ----
opt.relativenumber = true
opt.number = true
opt.numberwidth = 2

---- Cursor Highlighting --
opt.cursorline = true
opt.cursorcolumn = true

---- Indenting ----
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

---- Spell-check ----
opt.spell = false -- toggle when needed
opt.spelllang = { "en_gb" }

---- Other Options ----
-- stylua: ignore
opt.guicursor = ""            -- To make the cursor stay the same when in insert mode
opt.clipboard = "unnamedplus" -- Makes vim use the system clipboard
opt.scrolloff = 8
opt.showmode = false
opt.signcolumn = "yes:1"

---- Plugin Options ----
g.floaterm_width = 0.9
g.floaterm_height = 0.9

---- Create Folds ----
o.foldcolumn = "1"
o.foldlevelstart = 99 -- Start with all folds open
o.foldenable = true
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
