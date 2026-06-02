(import-macros {: gh} :lib.macros)

(vim.pack.add [(gh :Wansmer/langmapper.nvim)])

(let [langmapper (require :langmapper)
      opts {:custom_desc #:langmapped}]
  (langmapper.setup opts))
