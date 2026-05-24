(import-macros {: gh : specmap : cmd : !} :lib.macros)

{:src (gh :juniorsundar/refer.nvim)
 :dependencies {:src (gh :nvim-mini/mini.fuzzy)}
 :lazy false
 :opts {:min_query_len 0
        :debounce_ms 0
        :extras {:find_file true}
        :ui {:mark_char "*"}}
 :config (fn [_ opts]
           (let [refer (require :refer)]
             (refer.setup opts)
             (refer.setup_ui_select)
             (! (require :which-key) :add [{1 :<Leader>f :group :find}])))
 :keys [(specmap :n :<Leader>sf (cmd "Refer Files") {:desc "open file in cwd"})
        (specmap :n :<Leader><Leader> (cmd "Refer Files") {:desc "open file in cwd"})
        (specmap :n "<Leader>." (cmd "Refer Extras FindFile") {:desc "find file"})
        (specmap :n :<Leader>sb (cmd "Refer Buffers") {:desc "switch buffer"})
        (specmap :n "<Leader>," (cmd "Refer Buffers") {:desc "switch buffer"})
        (specmap :n :<Leader>sw (cmd "Refer Grep") {:desc "live grep"})
        (specmap :n :<Leader>sr (cmd "Refer Oldfiles")
                 {:desc "open recent file"})
        (specmap :n :<Leader>fh (cmd "Refer Help") {:desc "search help"})]}
