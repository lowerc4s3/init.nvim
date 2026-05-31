-- [nfnl] fnl/plugins/bento.fnl
local function _1_(_, opts)
  local bento = require("bento")
  local api = require("bento.api")
  bento.setup(opts)
  api.register_expand_key("<Tab>")
  api.register_last_buffer_key("<Tab>")
  api.register_collapse_key("<Esc>")
  api.register_prev_page_key("[")
  api.register_next_page_key("]")
  api.register_action("open", {key = "<CR>", action = api.actions.open, hl = "DiagnosticVirtualTextHint"})
  api.register_action("delete", {key = "<C-d>", action = api.actions.delete, hl = "DiagnosticVirtualTextError"})
  api.register_action("vsplit", {key = "<C-v>", action = api.actions.vsplit, hl = "DiagnosticVirtualTextInfo"})
  api.register_action("split", {key = "<C-s>", action = api.actions.split, hl = "DiagnosticVirtualTextInfo"})
  api.register_action("lock", {key = "*", action = api.actions.lock, hl = "DiagnosticVirtualTextWarn"})
  return api.set_default_action("open")
end
return {src = "https://github.com/lowerc4s3/bento.nvim", branch = "v2/bugfix", opts = {ui = {floating = {minimal_menu = "dashed"}}, lock_char = "\239\145\150", map_last_accessed = true, max_open_buffers = 8, ordering_metric = "filename"}, config = _1_}
