(import-macros {: gh : !} :lib.macros)

{; keymap cheatsheet
 :src (gh :folke/which-key.nvim)
 :dependencies {:src (gh :simifalaye/minibuffer.nvim)}
 :config (fn [_ opts]
           (! (require :which-key) :setup opts)
           (let [minibuf-wk (require :minibuffer.integrations.which-key)
                 wk-view (require :which-key.view)]
             (set wk-view.show minibuf-wk.show)
             (set wk-view.hide minibuf-wk.hide)))
 :opts {:plugins {:marks false
                  :registers false
                  :presets {:operators false
                            :motions false
                            :text_objects false
                            :windows false
                            :nav false}}
        :show_help false
        :show_keys false
        :delay #(or (and $.plugin 0) 200)
        :filter #(and $.desc (not= 1 ($.desc:find :langmapped 1 true)))
        :win {:no_overlap false}
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
        :spec [{1 :<Leader>f :group :find} {1 :<Leader>g :group :git}]}}
