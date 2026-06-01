-- [nfnl] fnl/plugins/project.fnl
local function _1_(_, opts)
  return require("project").setup(opts)
end
return {src = "https://github.com/DrKJeff16/project.nvim", keys = {"<Leader>sp", "<Cmd>Project fzf-lua<CR>", desc = "open project", mode = "n", silent = true}, opts = {fzf_lua = {enabled = true, show = "names"}, scope_chdir = "tab", lsp = {enabled = false}}, config = _1_, lazy = false}
