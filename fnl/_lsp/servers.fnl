(local {: config : enable} vim.lsp)

(config :rust_analyzer
        {:settings {:rust-analyzer {:inlayHints {:typeHints false
                                                 :chainingHints false
                                                 :parameterHints false
                                                 :closingBraceHints false}
                                    :check {:command :clippy}
                                    :imports {:granularity {:group :module
                                                            :prefix :self
                                                            :preferPrelude true}}
                                    :assist {:preferSelf true}}}})

(enable [:fennel_ls
         :rust_analyzer
         :tinymist])
