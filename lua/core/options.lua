vim.g.mapleader = " "

-- stylua: ignore start

---- Line Numbering ----
vim.opt.number = true             -- Line numbers
vim.opt.relativenumber = true     -- Relative line numbers

---- Cursor Highlighting ----
vim.opt.cursorline = true         -- Enable cursor line highlighting
vim.opt.cursorcolumn = true       -- Enable cursor column highlighting

---- Indenting ----
vim.opt.tabstop = 4               -- Number of spaces a real tab character is displayed as
vim.opt.shiftwidth = 4            -- Number of spaces an indent/un-indent action is
vim.opt.smartindent = true        -- Smart automatic indentation

---- Search Settings ----
vim.opt.ignorecase = true         -- Case-insensitive search
vim.opt.smartcase = true          -- Case-sensitive if uppercase in search

---- Visual Settings ----
vim.opt.guicursor = ""            -- Makes the cursor stay the same when in insert mode
vim.opt.wrap = false              -- Don't wrap lines
vim.opt.scrolloff = 8             -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 10        -- Keep 8 columns left/right cursor
vim.opt.showmode = false          -- Don't show mode in command line 
vim.opt.signcolumn = "yes:1"      -- Ensure the Sign Column (column for diagnostic symbols) is always visible

---- "vim-floaterm" plugin ----
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9

---- Folding settings ----
vim.o.foldenable = true           -- Enable Code Folding
vim.o.foldcolumn = "1"            -- Width of the column for the Fold Symbols
vim.o.foldlevelstart = 99         -- Start with all folds open
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

---- Other Settings ----
vim.opt.clipboard = "unnamedplus" -- Makes vim use the system clipboard
vim.opt.undofile = true           -- Add persistant undo across sessions
vim.opt.undodir = vim.fn.stdpath("config") .. "/.undo-history"

-- stylua: ignore end
