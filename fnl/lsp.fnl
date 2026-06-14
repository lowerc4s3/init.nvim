(import-macros {: gh : with-safely : |} :lib.macro)
(local {: autocmd : augroup : auclear} (require :lib.nvim))
(local {: lsp : pack} vim)

(with-safely :now
  (pack.add [(gh :neovim/nvim-lspconfig)]))

;;;
;;; configuration
;;;

(fn setup-word-ref-hl [buffer]
  (let [group (augroup :WordLspHighlight {:clear false})]
    (autocmd [:CursorHold :CursorHoldI]
             {: buffer : group :callback lsp.buf.document_highlight})
    (autocmd [:CursorMoved :CursorMovedI]
             {: buffer : group :callback lsp.buf.clear_references})
    (autocmd :LspDetach
             {:group (augroup :WordLspDetach)
              :callback (fn [{: buf}]
                          (lsp.buf.clear_references)
                          (auclear {:buffer buf :group :WordLspHighlight}))})))

(fn lsp-spinner [{:data {:params {: token : value}}}]
  (let [{: message : title : kind :percentage percent} value
        {: spinner} _G.Snacks.util
        status (if (= kind :end) :success :running)
        title (.. (if message (spinner) "󰄬") " " title)
        opts {:id (.. "lsp." token)
              :kind :progress
              :source :vim.lsp
              : title
              : status
              : percent}]
    (vim.api.nvim_echo [(| (or message "done"))] false opts))
  false)

(fn on-attach [{: buf :data {: client_id}}]
  (autocmd :LspProgress {: buf :callback lsp-spinner})
  (let [?client (lsp.get_client_by_id client_id)
        doc-hl :textDocument/documentHighlight]
    (when (and ?client (?client:supports_method doc-hl buf))
      (setup-word-ref-hl buf))))

(autocmd :LspAttach {:group (augroup :LspOnAttach) :callback on-attach})

;;;
;;; servers
;;;

(let [opts {:inlayHints {:typeHints false
                         :chainingHints false
                         :parameterHints false
                         :closingBraceHints false}
            :check {:command :clippy}
            :imports {:granularity {:group :module
                                    :prefix :self
                                    :preferPrelude true}}
            :assist {:preferSelf true}}]
  (lsp.config :rust_analyzer {:settings {:rust-analyzer opts}}))

(lsp.enable [:fennel_ls :rust_analyzer :tinymist])
