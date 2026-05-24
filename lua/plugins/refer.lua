-- [nfnl] fnl/plugins/refer.fnl
local function _1_(_, opts)
  local refer = require("refer")
  refer.setup(opts)
  refer.setup_ui_select()
  return require("which-key").add({{"<Leader>f", group = "find"}})
end
return {src = "https://github.com/juniorsundar/refer.nvim", dependencies = {src = "https://github.com/nvim-mini/mini.fuzzy"}, opts = {min_query_len = 0, debounce_ms = 0, extras = {find_file = true}, ui = {mark_char = "*"}}, config = _1_, keys = {{"<Leader>sf", "<Cmd>Refer Files<CR>", desc = "open file in cwd", modes = "n", silent = true}, {"<Leader><Leader>", "<Cmd>Refer Files<CR>", desc = "open file in cwd", modes = "n", silent = true}, {"<Leader>.", "<Cmd>Refer Extras FindFile<CR>", desc = "find file", modes = "n", silent = true}, {"<Leader>sb", "<Cmd>Refer Buffers<CR>", desc = "switch buffer", modes = "n", silent = true}, {"<Leader>,", "<Cmd>Refer Buffers<CR>", desc = "switch buffer", modes = "n", silent = true}, {"<Leader>sw", "<Cmd>Refer Grep<CR>", desc = "live grep", modes = "n", silent = true}, {"<Leader>sr", "<Cmd>Refer Oldfiles<CR>", desc = "open recent file", modes = "n", silent = true}, {"<Leader>fh", "<Cmd>Refer Help<CR>", desc = "search help", modes = "n", silent = true}}, lazy = false}
