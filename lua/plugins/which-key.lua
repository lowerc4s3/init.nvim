-- [nfnl] fnl/plugins/which-key.fnl
local function _1_(_, opts)
  return require("which-key").setup(opts)
end
local function _2_(_241)
  return ((_241.plugin and 0) or 200)
end
local function _3_(_241)
  return (_241.desc and (1 ~= _241.desc:find("langmapped", 1, true)))
end
return {src = "https://github.com/folke/which-key.nvim", dependencies = {src = "https://github.com/simifalaye/minibuffer.nvim"}, config = _1_, opts = {plugins = {presets = {motions = false, nav = false, operators = false, text_objects = false, windows = false}, marks = false, registers = false}, preset = "helix", delay = _2_, filter = _3_, win = {border = "solid", no_overlap = false, title = false}, icons = {separator = ":", keys = {up = "<up>", down = "<down>", left = "<left>", right = "<right>", C = "C-", M = "M-", D = "D-", S = "S-", CR = "RET", NL = "RET", BS = "DEL", Space = "SPC", Tab = "TAB", Esc = "ESC"}, mappings = false}, show_help = false, show_keys = false}}
