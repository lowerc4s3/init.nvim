-- [nfnl] fnl/navigation.fnl
vim.pack.add({"https://github.com/stevearc/oil.nvim", "https://github.com/ibhagwan/fzf-lua", "https://github.com/ahkohd/buffer-sticks.nvim", "https://github.com/DrKJeff16/project.nvim"})
do
  local opts = {delete_to_trash = true, watch_for_changes = true, constrain_cursor = "name", keymaps = {gS = {"actions.change_sort", mode = "n"}, q = {"actions.close", mode = "n"}, ["<C-s>"] = {"actions.select", opts = {horizontal = true}}, ["<C-v>"] = {"actions.select", opts = {vertical = true}}, ["<C-h>"] = false}}
  require("oil").setup(opts)
end
vim.keymap.set({"n"}, "-", "<Cmd>Oil<CR>", {desc = "open parent dir", silent = true})
local function _1_()
  do
    local opts
    local function _2_(...)
      return _G.FzfLua.actions.toggle_hidden(...)
    end
    local function _3_(...)
      return _G.FzfLua.actions.file_sel_to_qf(...)
    end
    local function _4_(...)
      return _G.FzfLua.actions.file_sel_to_ll(...)
    end
    opts = {{"ivy", "borderless", "hide"}, fzf_colors = true, keymap = {fzf = {true, ["ctrl-A"] = "toggle-all"}}, actions = {files = {true, ["ctrl-h"] = _2_, ["ctrl-Q"] = _3_, ["alt-Q"] = _4_}}}
    require("fzf-lua").setup(opts)
  end
  local fzf = _G.FzfLua
  vim.keymap.set({"n"}, "<Leader><Leader>", fzf.files, {desc = "open cwd file", silent = true})
  vim.keymap.set({"n"}, "<Leader>,", fzf.buffers, {desc = "switch buffer", silent = true})
  vim.keymap.set({"n"}, "<Leader>'", fzf.resume, {desc = "resume last search", silent = true})
  vim.keymap.set({"n"}, "<Leader>sf", fzf.files, {desc = "cwd file", silent = true})
  vim.keymap.set({"n"}, "<Leader>sb", fzf.buffers, {desc = "buffer", silent = true})
  vim.keymap.set({"n"}, "<Leader>sw", fzf.live_grep, {desc = "live grep", silent = true})
  vim.keymap.set({"n"}, "<Leader>sr", fzf.history, {desc = "recent file", silent = true})
  vim.keymap.set({"n"}, "<Leader>ss", fzf.builtin, {desc = "select picker", silent = true})
  vim.keymap.set({"n"}, "<Leader>hh", fzf.helptags, {desc = "helptags", silent = true})
  vim.keymap.set({"n"}, "<Leader>hk", fzf.keymaps, {desc = "keymaps", silent = true})
  vim.keymap.set({"n"}, "<Leader>ho", fzf.nvim_options, {desc = "options", silent = true})
  return vim.keymap.set({"n"}, "<Leader>hH", fzf.highlights, {desc = "highlights", silent = true})
end
require("mini.misc").safely("later", _1_)
local function _5_()
  do
    local opts = {fzf_lua = {enabled = true, show = "names"}, scope_chdir = "tab", lsp = {enabled = false}}
    require("project").setup(opts)
  end
  return vim.keymap.set({"n"}, "<Leader>sp", "<Cmd>Project fzf-lua<CR>", {desc = "project", silent = true})
end
require("mini.misc").safely("later", _5_)
do
  local opts = {list = {keys = {close_buffer = "<C-d>", move_up = "<C-k>", move_down = "<C-j>"}, filter = {keys = {move_up = "<C-k>", move_down = "<C-j>"}, title = "/"}}, winblend = 100, filter = {names = {"^$"}}, highlights = {active = {link = "Normal"}, list_selected = {link = "@function"}, alternate = {link = "Comment"}, inactive = {link = "Comment"}, active_modified = {link = "DiagnosticWarn"}, alternate_modified = {link = "DiagnosticWarn"}, inactive_modified = {link = "DiagnosticWarn"}, label = {link = "Bold"}, filter_title = {link = "Comment"}, filter_selected = {link = "@function"}}}
  require("buffer-sticks").setup(opts)
end
local function _6_()
  return _G.BufferSticks.jump()
end
return vim.keymap.set({"n"}, "<Tab>", _6_, {desc = "jump to buffer", silent = true})
