-- [nfnl] fnl/ui/tabby.fnl
vim.pack.add({"https://github.com/nanozuki/tabby.nvim"})
local function render(line)
  local tabs = line.tabs()
  local wins = line.wins_in_tab(line.api.get_current_tab())
  local theme = {active = "Normal", inactive = "LineNr", fill = "LineNr"}
  local function _1_(tab)
    local hl
    if tab.is_current() then
      hl = theme.active
    else
      hl = theme.inactive
    end
    local sep = line.sep(" ", hl, theme.fill)
    return {sep, tab.name(), sep, hl = hl}
  end
  local function _3_(win)
    local hl
    if win.is_current() then
      hl = theme.active
    else
      hl = theme.inactive
    end
    local sep = line.sep(" ", hl, theme.fill)
    return {sep, win.buf_name(), sep, hl = hl}
  end
  return {" \243\176\147\169 ", tabs.foreach(_1_), line.spacer(), wins.foreach(_3_), " \238\172\163 ", hl = theme.fill}
end
return require("tabby.tabline").set(render)
