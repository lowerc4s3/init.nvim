(import-macros {: gh} :lib.macros)

;; surround text with delimeters
{:src (gh :nvim-mini/mini.surround)
 :opts {:mappings {:add :gs
                   :delete :gsd
                   :replace :gsr
                   :find ""
                   :find_left ""
                   :highlight ""
                   :suffix_last ""
                   :suffix_next ""}
        ; place surroundings on separate lines in linewise mode
        ; and on each line in blockwise mode
        :respect_selection_type true}}
