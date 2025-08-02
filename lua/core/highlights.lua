-- Constants
local NVIM_TREE = { fg = "#71B0E8" }

-- Cursor Highlights
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2D313B" })
vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#2D313B" })

-- Dashboard
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#97C17C" })
vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#61A8E6" })
vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#61A8E6" })
vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#5BB3C1" })
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#4f4e5c" })

-- File Tree
vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", NVIM_TREE)
vim.api.nvim_set_hl(0, "NvimTreeRootFolder", NVIM_TREE)
vim.api.nvim_set_hl(0, "NvimTreeFolderName", NVIM_TREE)
vim.api.nvim_set_hl(0, "NvimTreeEmptyFolderName", NVIM_TREE)
vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", NVIM_TREE)
vim.api.nvim_set_hl(0, "NvimTreeSymlinkFolderName", NVIM_TREE)

-- DAP Virtual Text
vim.api.nvim_set_hl(0, "NvimDapVirtualText", { fg = "#4f4e5c" })
vim.api.nvim_set_hl(0, "NvimDapVirtualTextChanged", { fg = "#616073", bold = true })

-- Code Folding
vim.api.nvim_set_hl(0, "UfoFoldedBg", { bg = "NONE" })

-- Mini Icons
vim.api.nvim_set_hl(0, "BinaryFileIconColor", { fg = "#696d8c" })
vim.api.nvim_set_hl(0, "CSS_IconColor", { fg = "#8DC3EF" })
vim.api.nvim_set_hl(0, "CompressedFileIconColor", { fg = "#af6ec2" })
vim.api.nvim_set_hl(0, "EditorconfigIconColor", { fg = "#e3d0cc" })
vim.api.nvim_set_hl(0, "ExcelIconColor", { fg = "#7ab84d" })
vim.api.nvim_set_hl(0, "GifIconColor", { fg = "#d6bb72" })
vim.api.nvim_set_hl(0, "GitIconColor", { fg = "#fab387" })
vim.api.nvim_set_hl(0, "HTML_IconColor", { fg = "#D19A66" })
vim.api.nvim_set_hl(0, "HeaderFileIconColor", { fg = "#d19a66" })
vim.api.nvim_set_hl(0, "ImageIconColor", { fg = "#d6d67e" })
vim.api.nvim_set_hl(0, "JS_IconColor", { fg = "#E5C07A" })
vim.api.nvim_set_hl(0, "JavaIconColor", { fg = "#ba8b5d" })
vim.api.nvim_set_hl(0, "JsonIconColor", { fg = "#f5d07f" })
vim.api.nvim_set_hl(0, "JupyterIconColor", { fg = "#F37626" })
vim.api.nvim_set_hl(0, "LicenseIconColor", { fg = "#5abfc7" })
vim.api.nvim_set_hl(0, "LinuxIconColor", { fg = "#E5C07B" })
vim.api.nvim_set_hl(0, "LuaIconColor", { fg = "#89b4fa" })
vim.api.nvim_set_hl(0, "MarkdownIconColor", { fg = "#87bfed" })
vim.api.nvim_set_hl(0, "PDF_IconColor", { fg = "#d44861" })
vim.api.nvim_set_hl(0, "PythonIconColor", { fg = "#5ba0de" })
vim.api.nvim_set_hl(0, "SettingsIconColor", { fg = "#7f849c" })
vim.api.nvim_set_hl(0, "ShellIconColor", { fg = "#85c456" })
vim.api.nvim_set_hl(0, "TextFileIconColor", { fg = "#bcc5d4" })
vim.api.nvim_set_hl(0, "VideoIconColor", { fg = "#edaa64" })
vim.api.nvim_set_hl(0, "VimIconColor", { fg = "#a6e3a1" })
vim.api.nvim_set_hl(0, "WindowsIconColor", { fg = "#7abefa" })
vim.api.nvim_set_hl(0, "WordDocIconColor", { fg = "#5d8df5" })
vim.api.nvim_set_hl(0, "SnippetIconColor", { fg = "#76bbf5" })

-- Trouble
vim.api.nvim_set_hl(0, "TroubleNormal", { link = "Normal" })
vim.api.nvim_set_hl(0, "TroubleNormalNC", { link = "Normal" })
