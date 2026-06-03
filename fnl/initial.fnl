(import-macros {: gh : dot->} :lib.macros)

(vim.pack.add [(gh :Wansmer/langmapper.nvim)
               (gh :nvim-mini/mini.misc)])

(let [opts {:custom_desc #:langmapped}]
  (dot-> (require :langmapper) (setup opts)))
