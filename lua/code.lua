-- [nfnl] fnl/code.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_.autoload
vim.pack.add({"https://github.com/Olical/nfnl", "https://github.com/eraserhd/parinfer-rust", "https://github.com/lewis6991/gitsigns.nvim", "https://github.com/stevearc/conform.nvim"})
local function _2_()
  vim.pack.add({"https://github.com/dlyongemallo/diffview.nvim", "https://github.com/NeogitOrg/neogit"})
  do
    local opts = {disable_hint = true}
    require("neogit").setup(opts)
  end
  vim.keymap.set({"n"}, "<Leader>gg", "<Cmd>Neogit<CR>", {desc = "open neogit tab", silent = true})
  vim.keymap.set({"n"}, "<Leader>gl", "<Cmd>Neogit log<CR>", {desc = "view log", silent = true})
  vim.keymap.set({"n"}, "<Leader>gp", "<Cmd>Neogit pull<CR>", {desc = "pull", silent = true})
  return vim.keymap.set({"n"}, "<Leader>gP", "<Cmd>Neogit push<CR>", {desc = "push", silent = true})
end
require("mini.misc").safely("later", _2_)
local function _3_()
  vim.pack.add({"https://github.com/xzbdmw/colorful-menu.nvim", {src = "https://github.com/saghen/blink.cmp", version = "v1"}})
  local col_menu = autoload("colorful-menu")
  local icons = autoload("mini.icons")
  local function tabout(rhs)
    vim.api.nvim_feedkeys(vim.keycode(rhs), "i", false)
    return true
  end
  local col_text
  local function _4_(_241)
    return col_menu.blink_components_text(_241)
  end
  col_text = _4_
  local col_hl
  local function _5_(_241)
    return col_menu.blink_components_highlight(_241)
  end
  col_hl = _5_
  local get_kind_icon
  local function _6_(_241)
    return (" " .. icons.get("lsp", _241.kind) .. _241.icon_gap)
  end
  get_kind_icon = _6_
  local opts
  local function _7_(_241)
    if _241.is_visible() then
      return _241.select_next()
    elseif _241.snippet_active() then
      return _241.accept()
    else
      return nil
    end
  end
  local function _9_()
    return tabout("<Plug>(neotab-out)")
  end
  local function _10_(_241)
    if _241.is_visible() then
      return _241.select_prev()
    elseif _241.snippet_active() then
      return _241.snippet_backward()
    else
      return nil
    end
  end
  local function _12_()
    return tabout("<Plug>(neotab-reverse)")
  end
  opts = {signature = {enabled = true}, appearance = {nerd_font_variant = "normal"}, completion = {documentation = {auto_show = true}, ghost_text = {enabled = false}, list = {selection = {auto_insert = true, preselect = false}}, menu = {draw = {columns = {{"kind_icon"}, {"label", gap = 1}}, padding = 0, components = {label = {text = col_text, highlight = col_hl}, kind_icon = {text = get_kind_icon}}}}}, sources = {default = {"snippets", "lsp", "buffer"}}, keymap = {preset = "none", ["<CR>"] = {"select_and_accept", "fallback"}, ["<C-b>"] = {"scroll_documentation_up", "fallback"}, ["<C-f>"] = {"scroll_documentation_down", "fallback"}, ["<C-e>"] = {"cancel", "fallback"}, ["<Tab>"] = {_7_, _9_}, ["<S-Tab>"] = {_10_, _12_}}, cmdline = {completion = {menu = {auto_show = true}, list = {selection = {auto_insert = true, preselect = false}}}, keymap = {["<CR>"] = {"accept_and_enter", "fallback"}}}}
  return require("blink.cmp").setup(opts)
end
require("mini.misc").safely("event:InsertEnter,CmdLineEnter", _3_)
local function _13_()
  local ignored_fts = {"fennel"}
  local ignored_ft_3f
  local function _14_(...)
    return vim.tbl_contains(ignored_fts, ...)
  end
  ignored_ft_3f = _14_
  local opts
  local function _15_(bufnr)
    if not ignored_ft_3f(vim.bo[bufnr].filetype) then
      return {timeout_ms = 500}
    else
      return nil
    end
  end
  opts = {formatters_by_ft = {fennel = {"fnlfmt"}}, default_format_opts = {lsp_format = "fallback"}, format_on_save = _15_}
  require("conform").setup(opts)
  vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  return nil
end
return require("mini.misc").safely("later", _13_)
