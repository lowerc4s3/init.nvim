(import-macros {: gh : | : =>}  :lib.macro)

(vim.pack.add [(gh :nyoom-engineering/oxocarbon.nvim)
               (gh :nvim-mini/mini.icons)
               (gh :sschleemilch/slimline.nvim)
               (gh :folke/which-key.nvim)
               (gh :nanozuki/tabby.nvim)])

(vim.cmd.colorscheme :oxocarbon)

;;;
;;; mini.icons
;;;

(macro glyphs [table]
  (collect [pattern glyph (pairs table)]
    (values pattern {: glyph})))

(let [opts {:file (glyphs {:LICENSE ""
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
  (=> (require :mini.icons) (setup opts)))

;;;
;;; which-key
;;;

(let [opts {:preset :helix
            :show_help false
            :show_keys false
            :delay #(or (and $.plugin 0) 200)
            :filter #(and $.desc (not= 1 ($.desc:find :langmapped 1 true)))
            :win {:no_overlap false :border :solid :title false}
            :plugins {:marks false
                      :registers false
                      :presets {:operators false
                                :motions false
                                :text_objects false
                                :windows false
                                :nav false}}
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
  (=> (require :which-key) (setup opts)))

;;;
;;; tabby
;;;

(let [theme {:active :Normal :inactive :LineNr :fill :LineNr}
      render (fn [line]
               (let [tabs (line.tabs)
                     wins (line.wins_in_tab (line.api.get_current_tab))
                     tab-fn (fn [tab]
                              (let [hl (if (tab.is_current) theme.active
                                           theme.inactive)
                                    sep (line.sep " " hl theme.fill)]
                                (| sep (tab.name) sep {: hl})))
                     win-fn (fn [win]
                              (let [hl (if (win.is_current) theme.active
                                           theme.inactive)
                                    sep (line.sep " " hl theme.fill)]
                                (| sep (win.buf_name) sep {: hl})))]
                 (| " 󰓩 " (tabs.foreach tab-fn) (line.spacer) (wins.foreach win-fn) "  "
                    {:hl theme.fill})))]
  (=> (require :tabby.tabline) (set render)))

;;;
;;; slimline
;;;

(let [opts {:style :fg
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
  (=> (require :slimline) (setup opts)))
