(import-macros {: gh : !} :lib.macros)

{; keymap cheatsheet
 :src (gh :folke/which-key.nvim)
 :dependencies {:src (gh :simifalaye/minibuffer.nvim)}
 :config (fn [_ opts]
           (! (require :which-key) :setup opts))
 :opts {:plugins {:marks false
                  :registers false
                  :presets {:operators false
                            :motions false
                            :text_objects false
                            :windows false
                            :nav false}}
        :preset :helix
        :show_help false
        :show_keys false
        :delay #(or (and $.plugin 0) 200)
        :filter #(and $.desc (not= 1 ($.desc:find :langmapped 1 true)))
        :win {:no_overlap false
              :border :solid
              :title false}
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
                       :Esc :ESC}}}}
