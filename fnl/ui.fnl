(import-macros {: gh : tx} :lib.macros)

(vim.pack.add [(gh :nyoom-engineering/oxocarbon.nvim)
               (gh :nvim-mini/mini.icons)
               (gh :sschleemilch/slimline.nvim)
               (gh :folke/which-key.nvim)
               (gh :nanozuki/tabby.nvim)])

;;;
;;; mini.icons
;;;

(macro glyphs [table]
  (collect [pattern glyph (pairs table)]
    (values pattern {: glyph})))

(let [mini-icons (require :mini.icons)
      opts {:file (glyphs {:LICENSE ""
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
                          :color "󰌁"})}]
  (mini-icons.setup opts))

;;;
;;; which-key
;;;

(let [which-key (require :which-key)
      opts {:plugins {:marks false
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
            :win {:no_overlap false :border :solid :title false}
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
                           :Esc :ESC}}}]
  (which-key.setup opts))

;;;
;;; tabby
;;;

(let [tabline (require :tabby.tabline)
      theme {:active :Normal
             :inactive :LineNr
             :fill :LineNr}
      render (fn [line]
               (let [tabs (line.tabs)
                     wins (line.wins_in_tab (line.api.get_current_tab))]
                 (tx " 󰓩 "
                     (tabs.foreach (fn [tab]
                                     (let [hl (if (tab.is_current) theme.active
                                                  theme.inactive)
                                           sep (line.sep " " hl theme.fill)]
                                       (tx sep (tab.name) sep {: hl}))))
                     (line.spacer)
                     (wins.foreach (fn [win]
                                     (let [hl (if (win.is_current) theme.active
                                                  theme.inactive)
                                           sep (line.sep " " hl theme.fill)]
                                       (tx sep (win.buf_name) sep {: hl}))))
                     "  "
                     {:hl theme.fill})))]
  (tabline.set render))

;;;
;;; slimline
;;;

(let [slimline (require :slimline)
      opts {:style :fg
            :spaces {:left "" :right ""}
            :components {:left [:mode :recording :path :git]
                         :right [:diagnostics
                                 :filetype_lsp
                                 :selectioncount
                                 :searchcount
                                 :progress]}
            :configs {:path {:icons {:folder "󰉋 "
                                     :modified "[+]"
                                     :read_only "[RO]"}}
                      :git {:icons {:branch "#"}}
                      :diagnostics {:icons {:ERROR " "
                                            :WARN " "
                                            :HINT " "
                                            :INFO " "}}
                      :progress {:follow false :icon "󰦪"}}}]
  (slimline.setup opts))
