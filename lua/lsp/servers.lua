-- [nfnl] fnl/lsp/servers.fnl
local config = vim.lsp.config
local enable = vim.lsp.enable
config("rust_analyzer", {settings = {["rust-analyzer"] = {inlayHints = {chainingHints = false, closingBraceHints = false, parameterHints = false, typeHints = false}, check = {command = "clippy"}, imports = {granularity = {group = "module", prefix = "self", preferPrelude = true}}, assist = {preferSelf = true}}}})
return enable({"fennel_ls", "rust_analyzer", "tinymist"})
