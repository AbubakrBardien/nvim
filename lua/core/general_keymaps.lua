local terminal = require("custom_script_files.terminal")

-- stylua: ignore start

---- Split View Mappings ----
vim.keymap.set("n", "<A-Up>",    "<C-w>k",        { desc = "Go to Top window" })
vim.keymap.set("n", "<A-Down>",  "<C-w>j",        { desc = "Go to Bottom window" })
vim.keymap.set("n", "<A-Right>", "<C-w>l",        { desc = "Go to Right window" })
vim.keymap.set("n", "<A-Left>",  "<C-w>h",        { desc = "Go to Left window" })
vim.keymap.set("n", "<A-q>",     ":vs<CR><C-w>l", { desc = "Horizontal Split" })
vim.keymap.set("n", "<A-w>",     ":sp<CR><C-w>j", { desc = "Vertical Split" })
vim.keymap.set("n", "<A-e>",     ":q<CR>",        { desc = "Close split window", silent = true })

---- Buffer Navigation ----
vim.keymap.set("n", "<Tab>",     ":bnext<CR>",     { desc = "Go to Next Buffer", silent = true })
vim.keymap.set("n", "<S-Tab>",   ":bprevious<CR>", { desc = "Go to Previous Buffer", silent = true })

---- Toggle Folding ----
vim.keymap.set("n", "<CR>", "za", { desc = "Toggle Fold" })

---- Better Indenting in Visual Mode ----
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

---- Terminal ----
vim.keymap.set({ "n", "t" }, "<C-/>", terminal.toggle, { desc = "Toggle floating terminal" })
vim.keymap.set({ "n", "t" }, "<C-'>", terminal.kill,   { desc = "Kill terminal window" })
vim.keymap.set("t"         , "<C-;>", [[<C-\><C-n>]],  { desc = "Exit terminal mode" })

---- Quickfix List ----
local function toggle_qf()
  local qf_open = false
  for _, win in ipairs(vim.fn.getwininfo()) do
    if win.quickfix == 1 then
      qf_open = true
      break
    end
  end
  if qf_open then
    vim.cmd("cclose")
  else
    vim.cmd("copen")
  end
end

vim.keymap.set("n", "]q", ":cnext<CR>",     { desc = "Next quickfix item", silent = true })
vim.keymap.set("n", "[q", ":cprev<CR>",     { desc = "Previous quickfix item", silent = true })
vim.keymap.set("n", "<leader>q", toggle_qf, { desc = "Toggle quickfix list" })

---- Other ----
vim.keymap.set("n", "<C-s>",     ":w<CR>",        { desc = "Save File" })
vim.keymap.set("n", ";",         ":",             { desc = "Enter Command Mode" })
vim.keymap.set("n", "<Esc>",     ":noh<CR>",      { desc = "Clear Highlights", silent = true })
vim.keymap.set("n", "<C-a>",     "gg0vG$",        { desc = "Highlight File" })
vim.keymap.set("n", "<C-c>",     "gg0vG$y",       { desc = "Copy File Content" })
vim.keymap.set("n", "<C-d>",     ":bd<CR>",       { desc = "Delete Buffer", silent = true })

-- stylua: ignore end
