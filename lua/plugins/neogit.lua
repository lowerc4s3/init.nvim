-- [nfnl] fnl/plugins/neogit.fnl
local function _1_(_, opts)
  require("neogit").setup(opts)
  return require("which-key").add({{"<Leader>g", group = "git"}})
end
return {src = "https://github.com/NeogitOrg/neogit", dependencies = {src = "https://github.com/dlyongemallo/diffview.nvim"}, cmd = "Neogit", opts = {disable_hint = true, graph_style = "unicode"}, config = _1_, keys = {{"<Leader>gg", "<Cmd>Neogit<CR>", desc = "open neogit tab", modes = "n", silent = true}, {"<Leader>gl", "<Cmd>Neogit log<CR>", desc = "view log", modes = "n", silent = true}, {"<Leader>gp", "<Cmd>Neogit pull<CR>", desc = "pull", modes = "n", silent = true}, {"<Leader>gP", "<Cmd>Neogit push<CR>", desc = "push", modes = "n", silent = true}}}
