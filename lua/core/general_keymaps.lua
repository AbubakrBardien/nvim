-- stylua: ignore start

---- Split View Mappings ----
vim.keymap.set("n", "<A-Up>",    "<C-w>k",        { desc = "Go to Top window" })
vim.keymap.set("n", "<A-Down>",  "<C-w>j",        { desc = "Go to Bottom window" })
vim.keymap.set("n", "<A-Right>", "<C-w>l",        { desc = "Go to Right window" })
vim.keymap.set("n", "<A-Left>",  "<C-w>h",        { desc = "Go to Left window" })
vim.keymap.set("n", "<A-q>",     ":vs<CR><C-w>l", { desc = "Horizontal Split" })
vim.keymap.set("n", "<A-w>",     ":sp<CR><C-w>j", { desc = "Vertical Split" })
vim.keymap.set("n", "<A-e>",     ":q<CR>",        { desc = "Close split window" })

---- Buffer Navigation ----
vim.keymap.set("n", "<Tab>",     ":bnext<CR>",     { desc = "Go to Next Buffer" })
vim.keymap.set("n", "<S-Tab>",   ":bprevious<CR>", { desc = "Go to Previous Buffer" })

---- Toggle Folding ----
vim.keymap.set("n", "<CR>", "za", { noremap = true, silent = true, desc = "Toggle Fold" })

---- Better Indenting in Visual Mode ----
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

---- Other ----
vim.keymap.set("n", "<C-s>",     ":w<CR>",        { desc = "Save File" })
vim.keymap.set("n", ";",         ":",             { desc = "Enter Command Mode" })
vim.keymap.set("n", "<Esc>",     ":noh<CR>",      { desc = "Clear Highlights" })
vim.keymap.set("n", "<C-a>",     "gg0vG$",        { desc = "Highlight File" })
vim.keymap.set("n", "<C-c>",     "gg0vG$y",       { desc = "Copy File Content" })
vim.keymap.set("n", "<leader>s", ":source %<CR>", { desc = "Restart Neovim" })
vim.keymap.set("n", "<C-d>",     ":bd<CR>",       { desc = "Delete Buffer" })

-- stylua: ignore end
