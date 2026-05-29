-- [nfnl] fnl/lsp/init.fnl
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local autocmd_clear = vim.api.nvim_clear_autocmds
do
  local s = vim.diagnostic.severity
  local opts = {severity_sort = true, virtual_text = true, signs = {text = {[s.ERROR] = "\238\170\135", [s.WARN] = "\238\169\172", [s.HINT] = "\239\144\128", [s.INFO] = "\238\169\180"}, numhl = {[s.ERROR] = "DiagnosticSignError", [s.WARN] = "DiagnosticSignWarn", [s.HINT] = "DiagnosticSignHint", [s.WARN] = "DiagnosticSignWarn"}}}
  vim.diagnostic.config(opts)
end
local function setup_word_ref_hl(buffer)
  local group = augroup("WordLspHighlight", {clear = false})
  local lsp = vim.lsp.buf
  autocmd({"CursorHold", "CursorHoldI"}, {buffer = buffer, group = group, callback = lsp.document_highlight})
  autocmd({"CursorMoved", "CursorMovedI"}, {buffer = buffer, group = group, callback = lsp.clear_references})
  local function _2_(_1_)
    local buf = _1_.buf
    lsp.clear_references()
    return autocmd_clear({buffer = buf, group = "WordLspHighlight"})
  end
  return autocmd("LspDetach", {group = augroup("WordLspDetach", {clear = true}), callback = _2_})
end
local function on_attach(_3_)
  local buf = _3_.buf
  local _arg_4_ = _3_.data
  local client_id = _arg_4_.client_id
  local client = vim.lsp.get_client_by_id(client_id)
  local doc_hl = "textDocument/documentHighlight"
  if (client and client:supports_method(doc_hl, buf)) then
    return setup_word_ref_hl(buf)
  else
    return nil
  end
end
autocmd("LspAttach", {group = augroup("LspAttachGroup", {clear = true}), callback = on_attach})
return require("lsp.servers")
