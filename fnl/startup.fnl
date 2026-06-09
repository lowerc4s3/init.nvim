(import-macros {: gh : => : with-safely} :lib.macro)
(local {: pack} vim)

(pack.add [(gh :nvim-mini/mini.misc)])

(with-safely :now
  (pack.add [(gh :Wansmer/langmapper.nvim)])
  (let [opts {:custom_desc #:langmapped}] ; return static desc to ignore in which-key
    (=> (require :langmapper) (setup opts))))
