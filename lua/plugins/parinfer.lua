-- [nfnl] fnl/plugins/parinfer.fnl
local function _1_(_241)
  local function _2_()
  end
  return vim.system({"cargo", "build", "--release"}, {cwd = _241.path}, _2_)
end
return {src = "https://github.com/eraserhd/parinfer-rust", build = _1_}
