-- [nfnl] fnl/ui/slimline.fnl
vim.pack.add({"https://github.com/nvim-mini/mini.icons", "https://github.com/sschleemilch/slimline.nvim"})
local opts = {style = "fg", spaces = {left = "", right = ""}, components = {left = {"mode", "recording", "path", "git"}, right = {"diagnostics", "filetype_lsp", "selectioncount", "searchcount", "progress"}}, configs = {path = {icons = {folder = "\243\176\137\139 ", modified = "[+]", read_only = "[RO]"}}, git = {icons = {branch = "#"}}, diagnostics = {icons = {ERROR = "\238\170\135 ", WARN = "\238\169\172 ", HINT = "\239\144\128 ", INFO = "\238\169\180 "}}, progress = {icon = "\243\176\166\170", follow = false}}}
return require("slimline").setup(opts)
