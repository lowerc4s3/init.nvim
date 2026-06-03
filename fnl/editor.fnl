(import-macros {: gh : cb : map : plug : dot->} :lib.macros)
(local {: hi} (require :lib.nvim))

(vim.pack.add [(gh :tpope/vim-repeat)
               (cb :andyg/leap.nvim)
               (gh :nvim-mini/mini.jump)
               (gh :nvim-mini/mini.surround)
               (gh :kawre/neotab.nvim)
               {:src (gh :VonHeikemen/ts-enable.nvim) :version :v2.x}])

(dot-> (require :mini.jump) (setup))
(hi :MiniJump {:link :CurSearch})

(map :nxo :s (plug :leap) {:desc "leap in current window"})
(map :n :S (plug :leap-from-window) {:desc "leap to another window"})
(map :xo :ar (plug :leap-remote-text-object)
     {:desc "select remote outer text object"})
(map :xo :ar (plug :leap-remote-inner-text-object)
     {:desc "select remote inner text object"})

(let [opts {:mappings {:add :gs
                       :delete :gsd
                       :replace :gsr
                       :find ""
                       :find_left ""
                       :highlight ""
                       :suffix_last ""
                       :suffix_next ""}
            ;; place surroundings on separate lines in linewise mode
            ;; and on each line in blockwise mode
            :respect_selection_type true}]
  (dot-> (require :mini.surround) (setup opts)))

;; neotab's mappings are handled by blink.cmp
(let [opts {:tabkey "" :reverse_key ""}]
  (dot-> (require :neotab) (setup opts)))

(let [opts {:auto_init true :highlights true :folds true}]
  (set vim.g.ts_enable opts))
