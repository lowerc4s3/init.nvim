(import-macros {: gh : !} :lib.macros)

(fn render [line]
  (let [tabs (line.tabs)
        wins (line.wins_in_tab (line.api.get_current_tab))
        theme {:active :Normal
               :inactive :LineNr
               :fill :LineNr}]
    {1 " 󰓩 "
     2 (tabs.foreach (fn [tab]
                      (let [hl (if (tab.is_current) theme.active theme.inactive)
                            sep (line.sep " " hl theme.fill)]
                        {1 sep 2 (tab.name) 3 sep : hl})))
     
     3 (line.spacer)
     4 (wins.foreach (fn [win]
                       (let [hl (if (win.is_current) theme.active theme.inactive)
                             sep (line.sep " " hl theme.fill)]
                         {1 sep 2 (win.buf_name) 3 sep : hl})))
     5 "  "
     :hl theme.fill}))

{:src (gh :nanozuki/tabby.nvim)
 :config #((. (require :tabby.tabline) :set) render)}
