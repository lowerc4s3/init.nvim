(import-macros {: gh} :lib.macros)

(vim.pack.add [(gh :nvim-mini/mini.icons)
               (gh :sschleemilch/slimline.nvim)])

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
  ((. (require :slimline) :setup) opts))
