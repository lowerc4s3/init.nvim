(import-macros {: gh} :lib.macros)

;; TODO: ts textobjects

(vim.pack.add (gh :VonHeikemen/ts-enable.nvim))

(let [opts {:auto_init true
            :highlights true
            :folds true}]
  (set vim.g.ts_enable opts))
