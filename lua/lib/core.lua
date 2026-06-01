-- [nfnl] fnl/lib/core.fnl
local function str_3f(x)
  return ("string" == type(x))
end
return {["str?"] = str_3f}
