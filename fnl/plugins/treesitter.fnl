(import-macros {: gh} :macros)

{; simplify treesitter features management
 ; (install parsers, enable syntax hl, etc)
 :src (gh :VonHeikemen/ts-enable.nvim)
 :version :v2.x
 :init #(set vim.g.ts_enable {:auto_init true :highlights true :folds true})}
