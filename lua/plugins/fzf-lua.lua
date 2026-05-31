-- [nfnl] fnl/plugins/fzf-lua.fnl
local function _1_(...)
  return _G.FzfLua.actions.toggle_hidden(...)
end
local function _2_(...)
  return _G.FzfLua.actions.file_sel_to_qf(...)
end
local function _3_(...)
  return _G.FzfLua.actions.file_sel_to_ll(...)
end
local function _4_(_, opts)
  require("fzf-lua").setup(opts)
  return require("which-key").add({{"<Leader>s", group = "search"}, {"<Leader>h", group = "help"}})
end
return {src = "https://github.com/ibhagwan/fzf-lua", dependencies = "nvim-mini/mini.icons", opts = {{"ivy", "borderless", "hide"}, fzf_colors = true, ui_select = true, keymap = {fzf = {true, ["ctrl-A"] = "toggle-all"}}, actions = {files = {true, ["ctrl-h"] = _1_, ["ctrl-Q"] = _2_, ["alt-Q"] = _3_}}}, config = _4_, keys = {{"<Leader><Leader>", "<Cmd>FzfLua files<CR>", desc = "open cwd file", modes = "n", silent = true}, {"<Leader>,", "<Cmd>FzfLua buffers<CR>", desc = "switch buffer", modes = "n", silent = true}, {"<Leader>'", "<Cmd>FzfLua resume<CR>", desc = "resume last search", modes = "n", silent = true}, {"<Leader>sf", "<Cmd>FzfLua files<CR>", desc = "cwd file", modes = "n", silent = true}, {"<Leader>sb", "<Cmd>FzfLua buffers<CR>", desc = "buffer", modes = "n", silent = true}, {"<Leader>sw", "<Cmd>FzfLua live_grep<CR>", desc = "live grep", modes = "n", silent = true}, {"<Leader>sr", "<Cmd>FzfLua history<CR>", desc = "recent file", modes = "n", silent = true}, {"<Leader>ss", "<Cmd>FzfLua builtin<CR>", desc = "select picker", modes = "n", silent = true}, {"<Leader>hh", "<Cmd>FzfLua helptags<CR>", desc = "helptags", modes = "n", silent = true}, {"<Leader>hk", "<Cmd>FzfLua keymaps<CR>", desc = "keymaps", modes = "n", silent = true}, {"<Leader>ho", "<Cmd>FzfLua nvim_options<CR>", desc = "options", modes = "n", silent = true}, {"<Leader>hH", "<Cmd>FzfLua highlights<CR>", desc = "highlights", modes = "n", silent = true}}, lazy = false}
