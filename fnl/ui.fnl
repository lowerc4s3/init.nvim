(import-macros {: gh : | : => : with-safely} :lib.macro)
(local {: defmapgroup} (require :lib.nvim))
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
    (=> (require :which-key) (setup opts))
    (defmapgroup "<Leader>p" "packages")
    (defmapgroup "<Leader>c" "code")))

;;;
;;; tabby
;;;

(with-safely :now
  (pack.add [(gh :nanozuki/tabby.nvim)])

  (fn render [line]
    (let [theme {:active :Normal :inactive :LineNr :fill :LineNr}
          tabs (line.tabs)
          wins (line.wins_in_tab (line.api.get_current_tab))
          show-tab (fn [tab]
                     (let [hl (if (tab.is_current) theme.active theme.inactive)
                           sep (line.sep " " hl theme.fill)]
                       (| sep (tab.name) sep {: hl})))
          show-win (fn [win]
                     (let [hl (if (win.is_current) theme.active theme.inactive)
                           sep (line.sep " " hl theme.fill)]
                       (| sep (win.buf_name) sep {: hl})))]
      (| " 󰓩 " (tabs.foreach show-tab) (line.spacer) (wins.foreach show-win) "  "
         {:hl theme.fill})))

  (=> (require :tabby.tabline) (set render)))

;;;
;;; lualine
;;;

(with-safely :now
  (pack.add [(gh :nvim-lualine/lualine.nvim)])
  (let [colors {:primary :Normal :secondary :LineNr}
        options {:icons_enabled true
                 :component_separators {:left "" :right ""}
                 :section_separators {:left "" :right ""}
                 :refresh {:events [:WinEnter
                                    :BufEnter
                                    :BufWritePost
                                    :SessionLoadPost
                                    :FileChangedShellPost
                                    :VimResized
                                    :Filetype
                                    :CursorMoved
                                    :CursorMovedI
                                    :ModeChanged
                                    :DiagnosticChanged
                                    :RecordingEnter
                                    :RecordingLeave]}}
        extensions [:oil :quickfix]
        mode (| :mode {:fmt #($:sub 1 3)})
        branch (| :branch {:icons_enabled false :fmt #(.. "#" $)})
        diff (| :diff {:colored false :color colors.secondary})
        filename (| :filename
                    {:path 1 ; relative path
                     :symbols {:modified "[**]"
                               :readonly "[RO]"
                               :unnamed "[??]"
                               :newfile "[++]"}})
        recording (| #(vim.fn.reg_recording) {:icon "󰑊" :color :ErrorMsg})
        search-count (| :searchcount {:icon ""})
        selection-count (| :selectioncount {:icon "󰒉"})
        location (| :location {:color colors.secondary})
        progress (| "%P" {:color colors.secondary})
        sections {:lualine_a [mode]
                  :lualine_b []
                  :lualine_c [recording filename branch diff]
                  :lualine_x [:diagnostics
                              search-count
                              selection-count
                              location
                              progress]
                  :lualine_y []
                  :lualine_z []}
        filename-inactive (| :filename
                             {:file_status false
                              :path 1 ; relative path
                              :color colors.secondary
                              :symbols {:unnamed "[??]" :newfile "[++]"}})
        inactive_sections {:lualine_c [filename-inactive]
                           :lualine_x [location]}]
    (=> (require :lualine) (setup {: options
                                   : sections
                                   : inactive_sections
                                   : extensions}))))
