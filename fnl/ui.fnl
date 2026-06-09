(import-macros {: gh : | : => : with-safely} :lib.macro)
(local {: pack} vim)

(with-safely :now
  (pack.add [(gh :nyoom-engineering/oxocarbon.nvim)])
  (vim.cmd.colorscheme :oxocarbon))

;;;
;;; mini.icons
;;;

(with-safely :now
  (macro glyphs [table]
    (collect [pattern glyph (pairs table)]
      (values pattern {: glyph})))

  (pack.add [(gh :nvim-mini/mini.icons)])
  (let [opts {:file (glyphs {"LICENSE" ""
                             "LICENSE.md" ""
                             "LICENSE.txt" ""})
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
    (=> (require :mini.icons) (setup opts))))

;;;
;;; which-key
;;;

(with-safely :now
  (pack.add [(gh :folke/which-key.nvim)])
  (let [opts {:preset :helix
              :show_help false
              :show_keys false
              :delay #(if $.plugin 0 200)
              :filter #(not= $.desc :langmapped)
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
                      :keys {:up "<up>"
                             :down "<down>"
                             :left "<left>"
                             :right "<right>"
                             :C "C-"
                             :M "M-"
                             :D "D-"
                             :S "S-"
                             :CR "RET"
                             :NL "RET"
                             :BS "DEL"
                             :Space "SPC"
                             :Tab "TAB"
                             :Esc "ESC"}}}]
    (=> (require :which-key) (setup opts))))

;;;
;;; tabby
;;;

(with-safely :now
  (pack.add [(gh :nanozuki/tabby.nvim)])

  (fn render [line]
    (let [theme {:active :Normal :inactive :LineNr :fill :LineNr}
          tabs (line.tabs)
          wins (line.wins_in_tab (line.api.get_current_tab))
          tab-fn (fn [tab]
                   (let [hl (if (tab.is_current) theme.active theme.inactive)
                         sep (line.sep " " hl theme.fill)]
                     (| sep (tab.name) sep {: hl})))
          win-fn (fn [win]
                   (let [hl (if (win.is_current) theme.active theme.inactive)
                         sep (line.sep " " hl theme.fill)]
                     (| sep (win.buf_name) sep {: hl})))]
      (| " 󰓩 " (tabs.foreach tab-fn) (line.spacer) (wins.foreach win-fn) "  "
         {:hl theme.fill})))

  (=> (require :tabby.tabline) (set render)))

;;;
;;; slimline
;;;

(with-safely :now
  (pack.add [(gh :sschleemilch/slimline.nvim)])
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
    (=> (require :slimline) (setup opts))))
