-- [nfnl] fnl/build-hooks.fnl
local _local_1_ = require("lib.nvim")
local autocmd = _local_1_.autocmd
local callback
local function _5_(_2_)
  local _arg_3_ = _2_.data
  local kind = _arg_3_.kind
  local path = _arg_3_.path
  local _arg_4_ = _arg_3_.spec
  local name = _arg_4_.name
  print("kind = ", kind, ", path = ", path, ", spec.name = ", name)
  if ((name == "parinfer-rust") and ((kind == "update") or (kind == "install"))) then
    local function _6_()
    end
    return vim.system({"cargo", "build", "--release"}, {cwd = path}, _6_)
  else
    return nil
  end
end
callback = _5_
return autocmd("PackChanged", {callback = callback, desc = "build parinfer-rust"})
