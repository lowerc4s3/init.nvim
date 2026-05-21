-- [nfnl] fnl/plugins/artio.fnl
local _local_1_ = require("nfnl.module")
local autoload = _local_1_.autoload
local function _2_()
  local artio = require("artio")
  artio.setup({opts = {marker = "*", bottom = false, shrink = false}, mappings = {["<C-j>"] = "down", ["<C-n>"] = "down", ["<C-k>"] = "up", ["<C-p>"] = "up", ["<Enter>"] = "accept", ["<Tab>"] = "accept", ["<C-m>"] = "mark", ["<Esc>"] = "cancel", ["<C-g>"] = "togglelive", ["<C-l>"] = "togglepreview", ["<C-s>"] = "split", ["<C-v>"] = "vsplit", ["<C-t>"] = "tabnew"}})
  vim.ui.select = artio.select
  local pick = autoload("artio.builtins")
  local findprg = "fd --full-path --absolute-path --type f --color=never --"
  local grepprg = "rg --color=never --no-heading --with-filename --line-number --column --smart-case"
  local function _3_()
    return pick.files({findprg = findprg})
  end
  vim.keymap.set({"n"}, "<Leader>ff", _3_, {desc = "open file", silent = true})
  local function _4_()
    return pick.files({findprg = findprg})
  end
  vim.keymap.set({"n"}, "<Leader><Leader>", _4_, {desc = "open file", silent = true})
  local function _5_()
    return pick.grep({grepprg = grepprg})
  end
  vim.keymap.set({"n"}, "<Leader>fw", _5_, {desc = "live grep", silent = true})
  vim.keymap.set({"n"}, "<Leader>fb", pick.buffers, {desc = "switch buffer", silent = true})
  vim.keymap.set({"n"}, "<Leader>,", pick.buffers, {desc = "switch buffer", silent = true})
  vim.keymap.set({"n"}, "<Leader>fr", pick.oldfiles, {desc = "open recent file", silent = true})
  return vim.keymap.set({"n"}, "<Leader>fh", pick.helptags, {desc = "search helptags", silent = true})
end
return {src = "https://codeberg.org/comfysage/artio.nvim", dependencies = "nvim-mini/mini.icons", config = _2_}
