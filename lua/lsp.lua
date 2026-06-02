-- [nfnl] fnl/lsp.fnl
local _local_1_ = require("lib.nvim")
local autocmd = _local_1_.autocmd
local augroup = _local_1_.augroup
local auclear = _local_1_.auclear
local lsp = vim.lsp
local diagnostic = vim.diagnostic
do
  local s = diagnostic.severity
  local opts = {severity_sort = true, virtual_lines = {current_line = true}, virtual_text = {virt_text_pos = "eol_right_align", current_line = false}, signs = {text = {[s.ERROR] = "\238\170\135", [s.WARN] = "\238\169\172", [s.HINT] = "\239\144\128", [s.INFO] = "\238\169\180"}, numhl = {[s.ERROR] = "DiagnosticSignError", [s.WARN] = "DiagnosticSignWarn", [s.HINT] = "DiagnosticSignHint", [s.WARN] = "DiagnosticSignWarn"}}}
  diagnostic.config(opts)
end
local function setup_word_ref_hl(buffer)
  local group = augroup("WordLspHighlight", {clear = false})
  autocmd({"CursorHold", "CursorHoldI"}, {buffer = buffer, group = group, callback = lsp.buf.document_highlight})
  autocmd({"CursorMoved", "CursorMovedI"}, {buffer = buffer, group = group, callback = lsp.buf.clear_references})
  local function _3_(_2_)
    local buf = _2_.buf
    lsp.buf.clear_references()
    return auclear({buffer = buf, group = "WordLspHighlight"})
  end
  return autocmd("LspDetach", {group = augroup("WordLspDetach", {clear = true}), callback = _3_})
end
local function on_attach(_4_)
  local buf = _4_.buf
  local _arg_5_ = _4_.data
  local client_id = _arg_5_.client_id
  local _3fclient = lsp.get_client_by_id(client_id)
  local doc_hl = "textDocument/documentHighlight"
  if (_3fclient and _3fclient:supports_method(doc_hl, buf)) then
    return setup_word_ref_hl(buf)
  else
    return nil
  end
end
autocmd("LspAttach", {group = augroup("LspAttachGroup", {clear = true}), callback = on_attach})
lsp.config("rust_analyzer", {settings = {["rust-analyzer"] = {inlayHints = {chainingHints = false, closingBraceHints = false, parameterHints = false, typeHints = false}, check = {command = "clippy"}, imports = {granularity = {group = "module", prefix = "self", preferPrelude = true}}, assist = {preferSelf = true}}}})
return lsp.enable({"fennel_ls", "rust_analyzer", "tinymist"})
