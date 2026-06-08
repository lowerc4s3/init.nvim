(import-macros {: gh : =>} :lib.macro)

(vim.pack.add [(gh :Wansmer/langmapper.nvim)
               (gh :nvim-mini/mini.misc)])

(let [opts {:custom_desc #:langmapped}]
  (=> (require :langmapper) (setup opts)))
