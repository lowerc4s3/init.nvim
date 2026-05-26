(import-macros {: gh} :lib.macros)

;; simplify treesitter features management
;; (install parsers, enable syntax hl, etc)
{:src (gh :VonHeikemen/ts-enable.nvim)
 :version :v2.x
 :opts {:auto_init true
        :highlights true
        :folds true}}
