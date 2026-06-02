-- [nfnl] fnl/editor/treesitter.fnl
vim.pack.add("https://github.com/VonHeikemen/ts-enable.nvim")
local opts = {auto_init = true, highlights = true, folds = true}
vim.g.ts_enable = opts
return nil
