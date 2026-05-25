-- [nfnl] fnl/plugins/conform.fnl
local function _1_()
  return require("conform").format({async = true})
end
local function _2_(bufnr)
  local ignored_fts = {"fennel"}
  local ignored_ft_3f
  local function _3_(...)
    return vim.tbl_contains(ignored_fts, ...)
  end
  ignored_ft_3f = _3_
  if not ignored_ft_3f(vim.bo[bufnr].filetype) then
    return {timeout_ms = 500}
  else
    return nil
  end
end
return {src = "https://github.com/stevearc/conform.nvim", event = "BufWritePre", cmd = "ConformInfo", keys = {{"<Leader>cf", _1_, modes = "n", silent = true}}, opts = {formatters_by_ft = {fennel = {"fnlfmt"}}, default_format_opts = {lsp_format = "fallback"}, format_on_save = _2_}}
