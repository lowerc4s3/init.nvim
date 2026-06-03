(import-macros {: gh} :lib.macros)

(vim.pack.add [(gh :Wansmer/langmapper.nvim)
               (gh :nvim-mini/mini.misc)])

(let [langmapper (require :langmapper)
      opts {:custom_desc #:langmapped}]
  (langmapper.setup opts))
