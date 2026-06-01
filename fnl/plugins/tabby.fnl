(import-macros {: gh : tx} :lib.macros)

(fn render [line]
  (let [tabs (line.tabs)
        wins (line.wins_in_tab (line.api.get_current_tab))
        theme {:active :Normal
               :inactive :LineNr
               :fill :LineNr}]
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
        {:hl theme.fill})))

{:src (gh :nanozuki/tabby.nvim)
 :config #((. (require :tabby.tabline) :set) render)}
