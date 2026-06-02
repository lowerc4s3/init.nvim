-- [nfnl] fnl/editor/completion.fnl
local _local_1_ = require("lib.nvim")
local autocmd = _local_1_.autocmd
local _local_2_ = require("nfnl.module")
local autoload = _local_2_.autoload
local function callback()
  vim.pack.add({"https://github.com/xzbdmw/colorful-menu.nvim", {src = "https://github.com/saghen/blink.cmp", version = "v1"}})
  local function tabout(rhs)
    vim.api.nvim_feedkeys(vim.keycode(rhs), "i", false)
    return true
  end
  local col_menu = autoload("colorful-menu")
  local icons = autoload("mini.icons")
  local col_text
  local function _3_(_241)
    return col_menu.blink_components_text(_241)
  end
  col_text = _3_
  local col_hl
  local function _4_(_241)
    return col_menu.blink_components_highlight(_241)
  end
  col_hl = _4_
  local get_kind_icon
  local function _5_(_241)
    return (" " .. icons.get("lsp", _241.kind) .. _241.icon_gap)
  end
  get_kind_icon = _5_
  local opts
  local function _6_(_241)
    if _241.is_visible() then
      return _241.select_next()
    elseif _241.snippet_active() then
      return _241.accept()
    else
      return nil
    end
  end
  local function _8_()
    return tabout("<Plug>(neotab-out)")
  end
  local function _9_(_241)
    if _241.is_visible() then
      return _241.select_prev()
    elseif _241.snippet_active() then
      return _241.snippet_backward()
    else
      return nil
    end
  end
  local function _11_()
    return tabout("<Plug>(neotab-reverse)")
  end
  opts = {signature = {enabled = true}, appearance = {nerd_font_variant = "normal"}, completion = {documentation = {auto_show = true}, ghost_text = {enabled = false}, list = {selection = {auto_insert = true, preselect = false}}, menu = {draw = {columns = {{"kind_icon"}, {"label", gap = 1}}, padding = 0, components = {label = {text = col_text, highlight = col_hl}, kind_icon = {text = get_kind_icon}}}}}, sources = {default = {"snippets", "lsp", "buffer"}}, keymap = {preset = "none", ["<CR>"] = {"select_and_accept", "fallback"}, ["<C-b>"] = {"scroll_documentation_up", "fallback"}, ["<C-f>"] = {"scroll_documentation_down", "fallback"}, ["<C-e>"] = {"cancel", "fallback"}, ["<Tab>"] = {_6_, _8_}, ["<S-Tab>"] = {_9_, _11_}}, cmdline = {completion = {menu = {auto_show = true}, list = {selection = {auto_insert = true, preselect = false}}}, keymap = {["<CR>"] = {"accept_and_enter", "fallback"}}}}
  return require("blink.cmp").setup(opts)
end
return autocmd({"InsertEnter", "CmdLineEnter"}, {once = true, callback = callback})
