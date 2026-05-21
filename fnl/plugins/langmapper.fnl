(import-macros {: gh} :lib.macros)

{; support cyrillic mappings
 :src (gh :Wansmer/langmapper.nvim)
 :priority 1000
 :opts {:custom_desc #:langmapped}}
