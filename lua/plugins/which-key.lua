-- [nfnl] fnl/plugins/which-key.fnl
local function _1_(_241)
  return ((_241.plugin and 0) or 200)
end
local function _2_(_241)
  return (_241.desc and (1 ~= _241.desc:find("langmapped", 1, true)))
end
return {src = "https://github.com/folke/which-key.nvim", opts = {plugins = {presets = {motions = false, nav = false, operators = false, text_objects = false, windows = false}, marks = false, registers = false}, delay = _1_, filter = _2_, icons = {separator = ":", keys = {up = "<up>", down = "<down>", left = "<left>", right = "<right>", C = "C-", M = "M-", D = "D-", S = "S-", CR = "RET", NL = "RET", BS = "DEL", Space = "SPC", Tab = "TAB", Esc = "ESC"}, mappings = false}, spec = {{"<Leader>f", group = "find"}}, show_help = false}}
