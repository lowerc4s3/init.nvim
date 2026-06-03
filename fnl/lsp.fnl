(import-macros {: gh} :lib.macros)
(local {: autocmd : augroup : auclear} (require :lib.nvim))
(local {: lsp : diagnostic} vim)

(vim.pack.add [(gh :neovim/nvim-lspconfig)])

;;;
;;; configuration
;;;

(let [s diagnostic.severity
      opts {:severity_sort true
            :virtual_lines {:current_line true}
            :virtual_text {:virt_text_pos :eol_right_align
                           :current_line false}
            :signs {:text {s.ERROR ""
                           s.WARN ""
                           s.HINT ""
                           s.INFO ""}
                    :numhl {s.ERROR :DiagnosticSignError
                            s.WARN :DiagnosticSignWarn
                            s.HINT :DiagnosticSignHint
                            s.WARN :DiagnosticSignWarn}}}]
  (diagnostic.config opts))

(fn setup-word-ref-hl [buffer]
  (let [group (augroup :WordLspHighlight {:clear false})]
    (autocmd [:CursorHold :CursorHoldI]
             {: buffer : group :callback lsp.buf.document_highlight})
    (autocmd [:CursorMoved :CursorMovedI]
             {: buffer : group :callback lsp.buf.clear_references})
    (autocmd :LspDetach
             {:group (augroup :WordLspDetach {:clear true})
              :callback (fn [{: buf}]
                          (lsp.buf.clear_references)
                          (auclear {:buffer buf :group :WordLspHighlight}))})))

(fn on-attach [{: buf :data {: client_id}}]
  (let [?client (lsp.get_client_by_id client_id)
        doc-hl :textDocument/documentHighlight]
    (when (and ?client (?client:supports_method doc-hl buf))
      (setup-word-ref-hl buf))))

(autocmd :LspAttach {:group (augroup :LspAttachGroup {:clear true})
                     :callback on-attach})

;;;
;;; servers
;;;

(lsp.config :rust_analyzer
        {:settings {:rust-analyzer {:inlayHints {:typeHints false
                                                 :chainingHints false
                                                 :parameterHints false
                                                 :closingBraceHints false}
                                    :check {:command :clippy}
                                    :imports {:granularity {:group :module
                                                            :prefix :self
                                                            :preferPrelude true}}
                                    :assist {:preferSelf true}}}})

(lsp.enable [:fennel_ls
             :rust_analyzer
             :tinymist])
