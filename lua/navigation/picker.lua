-- [nfnl] fnl/navigation/picker.fnl
vim.pack.add({"https://github.com/nvim-mini/mini.icons", "https://github.com/ibhagwan/fzf-lua", "https://github.com/DrKJeff16/project.nvim"})
do
  local opts
  local function _1_(...)
    return _G.FzfLua.actions.toggle_hidden(...)
  end
  local function _2_(...)
    return _G.FzfLua.actions.file_sel_to_qf(...)
  end
  local function _3_(...)
    return _G.FzfLua.actions.file_sel_to_ll(...)
  end
  opts = {{"ivy", "borderless", "hide"}, fzf_colors = true, keymap = {fzf = {true, ["ctrl-A"] = "toggle-all"}}, actions = {files = {true, ["ctrl-h"] = _1_, ["ctrl-Q"] = _2_, ["alt-Q"] = _3_}}}
  require("fzf-lua").setup(opts)
end
do
  local opts = {fzf_lua = {enabled = true, show = "names"}, scope_chdir = "tab", lsp = {enabled = false}}
  require("project").setup(opts)
end
local fzf = _G.FzfLua
vim.keymap.set({"n"}, "<Leader><Leader>", fzf.files(), {desc = "open cwd file", silent = true})
vim.keymap.set({"n"}, "<Leader>,", fzf.buffers(), {desc = "switch buffer", silent = true})
vim.keymap.set({"n"}, "<Leader>'", fzf.resume(), {desc = "resume last search", silent = true})
vim.keymap.set({"n"}, "<Leader>sf", fzf.files(), {desc = "cwd file", silent = true})
vim.keymap.set({"n"}, "<Leader>sb", fzf.buffers(), {desc = "buffer", silent = true})
vim.keymap.set({"n"}, "<Leader>sw", fzf.live_grep(), {desc = "live grep", silent = true})
vim.keymap.set({"n"}, "<Leader>sr", fzf.history(), {desc = "recent file", silent = true})
vim.keymap.set({"n"}, "<Leader>ss", fzf.builtin(), {desc = "select picker", silent = true})
vim.keymap.set({"n"}, "<Leader>hh", fzf.helptags(), {desc = "helptags", silent = true})
vim.keymap.set({"n"}, "<Leader>hk", fzf.keymaps(), {desc = "keymaps", silent = true})
vim.keymap.set({"n"}, "<Leader>ho", fzf.nvim_options(), {desc = "options", silent = true})
return vim.keymap.set({"n"}, "<Leader>hH", fzf.highlights(), {desc = "highlights", silent = true})
