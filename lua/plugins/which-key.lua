-- [nfnl] fnl/plugins/which-key.fnl
local function _1_(_, opts)
  require("which-key").setup(opts)
  local minibuf_wk = require("minibuffer.integrations.which-key")
  local wk_view = require("which-key.view")
  wk_view.show = minibuf_wk.show
  wk_view.hide = minibuf_wk.hide
  return nil
end
local function _2_(_241)
  return ((_241.plugin and 0) or 200)
end
local function _3_(_241)
  return (_241.desc and (1 ~= _241.desc:find("langmapped", 1, true)))
end
return {src = "https://github.com/folke/which-key.nvim", dependencies = {src = "https://github.com/simifalaye/minibuffer.nvim"}, config = _1_, opts = {plugins = {presets = {motions = false, nav = false, operators = false, text_objects = false, windows = false}, marks = false, registers = false}, delay = _2_, filter = _3_, win = {no_overlap = false}, icons = {separator = ":", keys = {up = "<up>", down = "<down>", left = "<left>", right = "<right>", C = "C-", M = "M-", D = "D-", S = "S-", CR = "RET", NL = "RET", BS = "DEL", Space = "SPC", Tab = "TAB", Esc = "ESC"}, mappings = false}, spec = {{"<Leader>f", group = "find"}, {"<Leader>g", group = "git"}}, show_help = false, show_keys = false}}
