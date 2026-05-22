(import-macros {: gh : !} :lib.macros)

;; bootstrap zpack (lazy.nvim inspired vim.pack wrapper)
(vim.pack.add [(gh :zuqini/zpack.nvim)])

(! (require :zpack) :setup)
