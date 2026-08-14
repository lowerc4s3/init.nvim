(import-macros {: gh : => : with-safely} :lib.macro)
(local {: packadd} (require :lib.nvim))

(packadd (gh :nvim-mini/mini.misc))

(with-safely :now
  (packadd (gh :Wansmer/langmapper.nvim))
  (let [opts {:custom_desc #:langmapped}] ; return static desc to ignore in which-key
    (=> (require :langmapper) (setup opts))))
