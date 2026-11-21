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

-- Cycle through buffers, skipping Non-Code Buffers like terminals or the quickfix list
local function cycle_buf(dir)
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  local count = #bufs
  if count == 0 then
    return
  end

  local cur = vim.api.nvim_get_current_buf()
  local cur_idx = 1
  for i, b in ipairs(bufs) do
    if b.bufnr == cur then
      cur_idx = i
      break
    end
  end

  for offset = 1, count do
    local idx = ((cur_idx - 1 + offset * dir) % count) + 1
    local target = bufs[idx].bufnr
    local buftype = vim.bo[target].buftype
    if buftype == "" or target == cur then
      vim.api.nvim_set_current_buf(target)
      return
    end
  end
end

vim.keymap.set("n", "<Tab>",   function() cycle_buf(1)  end, { desc = "Go to Next Code Buffer",     silent = true })
vim.keymap.set("n", "<S-Tab>", function() cycle_buf(-1) end, { desc = "Go to Previous Code Buffer", silent = true })

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

-- stylua: ignore end

-- Open Quickfix List references while keeping the cursor in place
vim.keymap.set("n", "grr", function()
	local win = vim.api.nvim_get_current_win()
	vim.lsp.buf.references(nil, {
		on_list = function(options)
			vim.fn.setqflist({}, "r", {
				items = options.items,
				title = options.title,
			})
			vim.cmd("copen")
			vim.schedule(function()
				if vim.api.nvim_win_is_valid(win) then
					vim.api.nvim_set_current_win(win)
				end
			end)
		end,
	})
end, { desc = "LSP References (Quickfix)" })

-- stylua: ignore start

---- Other ----
vim.keymap.set("n", "<C-s>",     ":w<CR>",        { desc = "Save File" })
vim.keymap.set("n", ";",         ":",             { desc = "Enter Command Mode" })
vim.keymap.set("n", "<Esc>",     ":noh<CR>",      { desc = "Clear Highlights", silent = true })
vim.keymap.set("n", "<C-a>",     "gg0vG$",        { desc = "Highlight File" })
vim.keymap.set("n", "<C-c>",     "gg0vG$y",       { desc = "Copy File Content" })
vim.keymap.set("n", "<C-d>",     ":bd<CR>",       { desc = "Delete Buffer", silent = true })

-- stylua: ignore end
