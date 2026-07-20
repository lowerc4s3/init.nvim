(import-macros {: gh : cb : => : with-safely} :lib.macro)
(local {: hi} (require :lib.nvim))
(local {: map} (require :lib.map))
(local {: pack : diagnostic} vim)

(let [s diagnostic.severity
      opts {:severity_sort true
            :virtual_lines {:current_line true}
            :virtual_text {:virt_text_pos :eol_right_align :current_line false}
            :signs {:text {s.ERROR ""
                           s.WARN ""
                           s.HINT ""
                           s.INFO ""}
                    :numhl {s.ERROR :DiagnosticSignError
                            s.WARN :DiagnosticSignWarn
                            s.HINT :DiagnosticSignHint
                            s.WARN :DiagnosticSignWarn}}}]
  (diagnostic.config opts))

;;;
;;; mini.jump
;;;

(with-safely :now
  (pack.add [(gh :nvim-mini/mini.jump)])
  (=> (require :mini.jump) (setup))
  (hi :MiniJump {:link :CurSearch}))

;;;
;;; leap.nvim
;;;

(with-safely :now
  (pack.add [(gh :tpope/vim-repeat) (cb :andyg/leap.nvim)])
  (map [:n :x :o] "s" "<plug>(leap)" {:desc "leap in current window"})
  (map :n "S" "<plug>(leap-from-window)" {:desc "leap to another window"})
  (map [:x :o] "ar" "<plug>(leap-remote-text-object)"
       {:desc "select remote outer text object"})
  (map [:x :o] "ir" "<plug>(leap-remote-inner-text-object)"
       {:desc "select remote inner text object"}))

;;;
;;; mini.surround
;;;

(with-safely :now
  (pack.add [(gh :nvim-mini/mini.surround)])
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
    (=> (require :mini.surround) (setup opts))))

;;;
;;; autopairs
;;;

(with-safely [:on-event :InsertEnter]
  (pack.add [(gh :windwp/nvim-autopairs)])
  (let [opts {:disable_filetype [:TelescopePrompt :snacks_picker_input :fennel]}]
    (=> (require :nvim-autopairs) (setup opts))))

;;;
;;; neotab
;;;

;; neotab's mappings are handled by blink.cmp
(with-safely :now
  (pack.add [(gh :kawre/neotab.nvim)])
  (let [opts {:tabkey "" :reverse_key ""}]
    (=> (require :neotab) (setup opts))))

;;;
;;; tree-sitter-manager
;;;

(with-safely :now
  (pack.add [(gh :romus204/tree-sitter-manager.nvim)])
  (let [opts {:border :solid}]
    (=> (require :tree-sitter-manager) (setup opts))))

;;;
;;; treesitter-textobjects
;;;

;; this one loads pretty slow
(with-safely :later
  (pack.add [(gh :nvim-treesitter/nvim-treesitter-textobjects)])
  (let [opts {:select {:selection_modes {"@loop.outer" :V
                                         "@condition.outer" :V
                                         "@class.outer" :V
                                         "@comment.outer" :V}}}]
    (=> (require :nvim-treesitter-textobjects) (setup opts)))
  (let [sel #(=> (require :nvim-treesitter-textobjects.select)
                 (select_textobject $ :textobjects))
        map-textobject (fn [lhs capture]
                         (map [:x :o] lhs #(sel capture) {:silent true}))]
    (map-textobject "if" "@function.inner")
    (map-textobject "af" "@function.outer")
    (map-textobject "ia" "@parameter.inner")
    (map-textobject "aa" "@parameter.outer")
    (map-textobject "iL" "@loop.inner")
    (map-textobject "aL" "@loop.outer")
    (map-textobject "ic" "@condition.inner")
    (map-textobject "ac" "@condition.outer")
    (map-textobject "ik" "@assignment.lhs")
    (map-textobject "iv" "@assignment.rhs")
    (map-textobject "ak" "@assignment.lhs")
    (map-textobject "av" "@assignment.rhs")))

(with-safely :later
  (pack.add [(gh :nvim-treesitter/nvim-treesitter-context)])
  (let [opts {:mode :topline :max_lines 2}]
    (=> (require :treesitter-context) (setup opts))))

;;;
;;; quicker
;;;

(with-safely :now
  (pack.add [(gh :stevearc/quicker.nvim)])
  (let [sev vim.diagnostic.severity
        {:signs {:text icons}} (vim.diagnostic.config)
        opts {:borders {:vert "│"
                        :strong_header "─"
                        :strong_cross "┼"
                        :strong_end "┤"
                        :soft_header "╌"
                        :soft_cross "┼"
                        :soft_end "┤"}
              :type_icons {:E (. icons sev.ERROR)
                           :W (. icons sev.WARN)
                           :I (. icons sev.INFO)
                           :N (. icons sev.INFO)
                           :H (. icons sev.HINT)}}]
    (=> (require :quicker) (setup opts))))

;;;
;;; direnv
;;;

(with-safely :now
  (pack.add [(gh :NotAShelf/direnv.nvim)])
  (let [opts {:keybindings false
              :autoload_direnv true}]
    (=> (require :direnv) (setup opts))))
