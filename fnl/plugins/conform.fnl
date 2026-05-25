(import-macros {: gh : specmap : !} :lib.macros)

{:src (gh :stevearc/conform.nvim)
 :event :BufWritePre
 :cmd :ConformInfo
 :keys [(specmap :n :<Leader>cf #(! (require :conform) :format {:async true}))]
 :opts {:formatters_by_ft {:fennel [:fnlfmt]}
        :default_format_opts {:lsp_format :fallback}
        :format_on_save (fn [bufnr]
                          ;; fnlfmt sometimes produces really stupid formatting
                          ;; so the manual formatter call is prefered
                          (let [ignored-fts [:fennel]
                                ignored-ft? (partial vim.tbl_contains
                                                     ignored-fts)]
                            (when (not (ignored-ft? (. vim.bo bufnr :filetype)))
                              {:timeout_ms 500})))}}
