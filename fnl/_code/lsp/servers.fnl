(import-macros {: gh} :lib.macros)
(local {: config : enable} vim.lsp)

(vim.pack.add [(gh :neovim/nvim-lspconfig)])

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
