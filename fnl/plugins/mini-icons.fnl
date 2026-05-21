(import-macros {: gh} :macros)
(macro expand-glyphs [glyph-tbl]
  (collect [pattern glyph (pairs glyph-tbl)]
    (values pattern {: glyph})))

{; icons provider
 :src (gh :nvim-mini/mini.icons)
 :opts {:file (expand-glyphs {:LICENSE "󰗑"
                              :LICENSE.md "󰗑"
                              :LICENSE.txt "󰗑"})
        :filetype (expand-glyphs {:typst ""})}}
