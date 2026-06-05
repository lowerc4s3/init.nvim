-- [nfnl] fnl/core.fnl
local _local_1_ = require("lib.nvim")
local autocmd = _local_1_.autocmd
local augroup = _local_1_.augroup
local g = vim.g
local o = vim.o
local opt = vim.opt
o.expandtab = true
o.smarttab = true
o.autoindent = true
o.smartindent = true
do
  local spaces = 4
  o.tabstop = spaces
  o.softtabstop = spaces
  o.shiftwidth = spaces
end
o.ignorecase = true
o.smartcase = true
o.virtualedit = "block"
o.splitright = true
o.splitbelow = true
o.mouse = "a"
o.clipboard = "unnamedplus"
o.timeoutlen = 1000
o.swapfile = false
o.updatetime = 5000
o.undofile = true
opt.sessionoptions:prepend("globals")
o.termguicolors = true
o.number = true
o.relativenumber = true
o.scrolloff = 8
o.sidescrolloff = 8
o.cursorline = true
o.title = true
o.winborder = "none"
o.completeopt = "menu,menuone,popup,noselect"
o.conceallevel = 2
o.wrap = false
o.linebreak = true
o.foldlevel = 999
opt.guicursor:prepend({"a:Cursor"})
do
  local ui = require("vim._core.ui2")
  ui.enable({msg = {target = "msg"}})
end
o.cmdheight = 0
o.ruler = false
o.showmode = false
o.showcmd = false
o.laststatus = 2
o.signcolumn = "yes"
opt.shortmess:append({S = true})
o.spelllang = "en_us,ru"
do
  local esc
  local function _2_(_241)
    return vim.fn.escape(_241, ";,.\"|\\]")
  end
  esc = _2_
  local en = esc("`qwertyuiop[]asdfghjkl;'zxcvbnm")
  local ru = esc("\209\145\208\185\209\134\209\131\208\186\208\181\208\189\208\179\209\136\209\137\208\183\209\133\209\138\209\132\209\139\208\178\208\176\208\191\209\128\208\190\208\187\208\180\208\182\209\141\209\143\209\135\209\129\208\188\208\184\209\130\209\140")
  local en_caps = esc("~QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>")
  local ru_caps = esc("\195\139\208\153\208\166\208\163\208\154\208\149\208\157\208\147\208\168\208\169\208\151\208\165\208\170\208\164\208\171\208\146\208\144\208\159\208\160\208\158\208\155\208\148\208\150\208\173\208\175\208\167\208\161\208\156\208\152\208\162\208\172\208\145\208\174")
  o.langmap = (ru_caps .. ";" .. en_caps .. "," .. ru .. ";" .. en)
end
g.mapleader = " "
g.maplocalleader = ","
vim.keymap.set({"n", "v", "o"}, "<Space>", "<Nop>", {silent = true})
vim.keymap.set({"n"}, "<Esc>", "<Cmd>nohlsearch<CR>", {desc = "disable search hl", silent = true})
vim.keymap.set({"n", "v", "o"}, "gl", "$", {desc = "to the end of the line", silent = true})
vim.keymap.set({"n", "v", "o"}, "gh", "^", {desc = "to the first non-blank character of the line", silent = true})
vim.keymap.set({"v"}, "<", "<gv", {silent = true})
vim.keymap.set({"v"}, ">", ">gv", {silent = true})
vim.keymap.set({"n"}, "<C-h>", "<C-w>h", {desc = "move to the left window", silent = true})
vim.keymap.set({"n"}, "<C-j>", "<C-w>j", {desc = "move to the lower window", silent = true})
vim.keymap.set({"n"}, "<C-k>", "<C-w>k", {desc = "move to the upper window", silent = true})
vim.keymap.set({"n"}, "<C-l>", "<C-w>l", {desc = "move to the right window", silent = true})
vim.keymap.set({"i"}, "<C-h>", "<Left>", {desc = "move left", silent = true})
vim.keymap.set({"i"}, "<C-j>", "<Down>", {desc = "move down", silent = true})
vim.keymap.set({"i"}, "<C-k>", "<Up>", {desc = "move up", silent = true})
vim.keymap.set({"i"}, "<C-l>", "<Right>", {desc = "move right", silent = true})
local group = augroup("NuvimAutocmds", {clear = true})
local function _3_()
  return vim.keymap.set({"n"}, "q", "<Cmd>close<CR>", {desc = "Close help", buf = 0, silent = true})
end
autocmd("FileType", {group = group, pattern = {"help", "qf", "man"}, desc = "quit help pages with 'q'", callback = _3_})
local function _4_()
  return vim.hl.on_yank({higroup = "Visual"})
end
return autocmd("TextYankPost", {group = group, callback = _4_})
