(import-macros {: gh : reqfn} :lib.macros)

{; keymap cheatsheet
 :src (gh :folke/which-key.nvim)
 :opts {:plugins {:marks false
                  :registers false
                  :presets {:operators false
                            :motions false
                            :text_objects false
                            :windows false
                            :nav false}}
        :show_help false
        :delay #(or (and $1.plugin 0) 200)
        :filter #(and $1.desc (not= 1 ($1.desc:find :langmapped 1 true)))
        :icons {:mappings false
                :separator ":"
                :keys {:up :<up>
                       :down :<down>
                       :left :<left>
                       :right :<right>
                       :C :C-
                       :M :M-
                       :D :D-
                       :S :S-
                       :CR :RET
                       :NL :RET
                       :BS :DEL
                       :Space :SPC
                       :Tab :TAB
                       :Esc :ESC}}
        :spec [{1 :<Leader>f :group :find}]}}
