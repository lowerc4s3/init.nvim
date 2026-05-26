(import-macros {: map} :lib.macros)

(local autocmd vim.api.nvim_create_autocmd)
(local augroup vim.api.nvim_create_augroup)
(local autocmd-clear vim.api.nvim_clear_autocmds)

(let [s vim.diagnostic.severity
      opts {:severity_sort true
            :virtual_text true
            :signs {:text {s.ERROR ""
                           s.WARN ""
                           s.HINT ""
                           s.INFO ""}
                    :numhl {s.ERROR :DiagnosticSignError
                            s.WARN :DiagnosticSignWarn
                            s.HINT :DiagnosticSignHint
                            s.WARN :DiagnosticSignWarn}}}]
  (vim.diagnostic.config opts))

(fn setup-word-ref-hl [buffer]
  (let [group (augroup :WordLspHighlight {:clear false})
        lsp vim.lsp.buf]
    (autocmd [:CursorHold :CursorHoldI]
             {: buffer : group :callback lsp.document_highlight})
    (autocmd [:CursorMoved :CursorMovedI]
             {: buffer : group :callback lsp.clear_references})
    (autocmd :LspDetach
             {:group (augroup :WordLspDetach {:clear true})
              :callback (fn [{: buf}]
                          (lsp.clear_references)
                          (autocmd-clear {:buffer buf :group :WordLspHighlight}))})))

(fn on-attach [{: buf :data {: client_id}}]
  (let [client (vim.lsp.get_client_by_id client_id)
        doc-hl :textDocument/documentHighlight]
    (when (and client (client:supports_method doc-hl buf))
      (setup-word-ref-hl buf))))

(autocmd :LspAttach {:group (augroup :LspAttachGroup {:clear true})
                     :callback on-attach})

(require :lsp.servers)
