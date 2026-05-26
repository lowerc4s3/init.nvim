(import-macros {: gh} :lib.macros)

(macro glyphs [table]
  (collect [pattern glyph (pairs table)]
    (values pattern {: glyph})))

;; icons provider
{:src (gh :nvim-mini/mini.icons)
 :opts {:file (glyphs {:LICENSE ""
                       :LICENSE.md ""
                       :LICENSE.txt ""})
        :filetype (glyphs {:typst ""})
        :lsp (glyphs {:constant "󰏿"
                      :function "󰘧"
                      :method "󰘧"
                      :value "α"
                      :variable "󰆦"
                      :field "󰆦"
                      :text "󱌯"
                      :string "󰉾"
                      :keyword "󰒠"
                      :struct "󱡠"
                      :class "󱡠"
                      :typeparameter "*"
                      :snippet "󰆏"
                      :color "󰌁"})}}
