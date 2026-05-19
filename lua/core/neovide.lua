-- [nfnl] fnl/core/neovide.fnl
vim.opt.linespace = 13
do
  local pad = 10
  vim.g["neovide_padding_top"] = pad
  vim.g["neovide_padding_bottom"] = pad
  vim.g["neovide_padding_right"] = pad
  vim.g["neovide_padding_left"] = pad
end
vim.g["neovide_scroll_animation_length"] = 0.1
vim.g["neovide_scroll_animation_far_lines"] = 3
vim.g["neovide_cursor_animation_length"] = 0.15
vim.g["neovide_cursor_short_animation_length"] = 0.04
vim.g["neovide_cursor_trail_size"] = 1
vim.g["neovide_cursor_smooth_blink"] = true
vim.g["neovide_floating_shadow"] = false
vim.g["neovide_input_macos_option_key_is_meta"] = "only_right"
local function mod(key)
  local prefix
  if vim.fn.has("macunix") then
    prefix = "<D-"
  else
    prefix = "<C-S-"
  end
  return (prefix .. key .. ">")
end
local function _2_()
  local function _3_()
  end
  return vim.uv.spawn("neovide", {detached = true}, _3_)
end
vim.keymap.set({"n"}, mod("n"), _2_, {desc = "spawn new instance", silent = true})
local function _4_()
  return vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
end
return vim.keymap.set({"n", "v", "s", "x", "o", "i", "l", "c", "t"}, mod("v"), _4_, {desc = "paste from system clipboard", silent = true})
