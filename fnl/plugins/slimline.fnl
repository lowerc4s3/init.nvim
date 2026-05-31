(import-macros {: gh} :lib.macros)

;; statusline
{:src (gh :sschleemilch/slimline.nvim)
 :dependencies {:src (gh :nvim-mini/mini.icons)}
 :opts {:style :fg
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
                  :progress {:follow false :icon "󰦪"}}}}
