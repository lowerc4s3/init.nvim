-- [nfnl] fnl/ui.fnl
vim.pack.add({"https://github.com/nyoom-engineering/oxocarbon.nvim", "https://github.com/nvim-mini/mini.icons", "https://github.com/sschleemilch/slimline.nvim", "https://github.com/folke/which-key.nvim", "https://github.com/nanozuki/tabby.nvim"})
vim.cmd.colorscheme("oxocarbon")
do
  local opts = {file = {LICENSE = {glyph = "\239\146\149"}, ["LICENSE.md"] = {glyph = "\239\146\149"}, ["LICENSE.txt"] = {glyph = "\239\146\149"}}, filetype = {typst = {glyph = "\239\141\191"}}, lsp = {class = {glyph = "\243\177\161\160"}, color = {glyph = "\243\176\140\129"}, constant = {glyph = "\243\176\143\191"}, field = {glyph = "\243\176\134\166"}, ["function"] = {glyph = "\243\176\152\167"}, keyword = {glyph = "\243\176\146\160"}, method = {glyph = "\243\176\152\167"}, snippet = {glyph = "\243\176\134\143"}, string = {glyph = "\243\176\137\190"}, struct = {glyph = "\243\177\161\160"}, text = {glyph = "\243\177\140\175"}, typeparameter = {glyph = "*"}, value = {glyph = "\206\177"}, variable = {glyph = "\243\176\134\166"}}}
  require("mini.icons").setup(opts)
end
do
  local opts
  local function _1_(_241)
    return ((_241.plugin and 0) or 200)
  end
  local function _2_(_241)
    return (_241.desc and (1 ~= _241.desc:find("langmapped", 1, true)))
  end
  opts = {preset = "helix", delay = _1_, filter = _2_, win = {border = "solid", no_overlap = false, title = false}, plugins = {presets = {motions = false, nav = false, operators = false, text_objects = false, windows = false}, marks = false, registers = false}, icons = {separator = ":", keys = {up = "<up>", down = "<down>", left = "<left>", right = "<right>", C = "C-", M = "M-", D = "D-", S = "S-", CR = "RET", NL = "RET", BS = "DEL", Space = "SPC", Tab = "TAB", Esc = "ESC"}, mappings = false}, show_help = false, show_keys = false}
  require("which-key").setup(opts)
end
do
  local theme = {active = "Normal", inactive = "LineNr", fill = "LineNr"}
  local render
  local function _3_(line)
    local tabs = line.tabs()
    local wins = line.wins_in_tab(line.api.get_current_tab())
    local tab_fn
    local function _4_(tab)
      local hl
      if tab.is_current() then
        hl = theme.active
      else
        hl = theme.inactive
      end
      local sep = line.sep(" ", hl, theme.fill)
      return {sep, tab.name(), sep, hl = hl}
    end
    tab_fn = _4_
    local win_fn
    local function _6_(win)
      local hl
      if win.is_current() then
        hl = theme.active
      else
        hl = theme.inactive
      end
      local sep = line.sep(" ", hl, theme.fill)
      return {sep, win.buf_name(), sep, hl = hl}
    end
    win_fn = _6_
    return {" \243\176\147\169 ", tabs.foreach(tab_fn), line.spacer(), wins.foreach(win_fn), " \238\172\163 ", hl = theme.fill}
  end
  render = _3_
  require("tabby.tabline").set(render)
end
local opts = {style = "fg", spaces = {left = "", right = ""}, components = {left = {"mode", "recording", "path", "git"}, right = {"diagnostics", "filetype_lsp", "selectioncount", "searchcount", "progress"}}, configs = {path = {icons = {folder = "\243\176\137\139 ", modified = "[+]", read_only = "[RO]"}}, git = {icons = {branch = "#"}}, diagnostics = {icons = {ERROR = "\238\170\135 ", WARN = "\238\169\172 ", HINT = "\239\144\128 ", INFO = "\238\169\180 "}}, progress = {icon = "\243\176\166\170", follow = false}}}
return require("slimline").setup(opts)
