(import-macros {: gh} :lib.macros)

;; navigate within delimeters with tab
{:src (gh :kawre/neotab.nvim)
 :event [:InsertEnter :CmdLineEnter]
 :opts {; mappings are handled by blink
        :tabkey ""
        :reverse_key ""}}
