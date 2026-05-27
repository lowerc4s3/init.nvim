(import-macros {: gh : !} :lib.macros)

{:src (gh :serhez/bento.nvim)
 :opts {:ui {:floating {:minimal_menu :dashed}}
        :lock_char ""
        :map_last_accessed true
        :max_open_buffers 8
        :ordering_metric :filename}}

;; NOTE: the remaining configuration is meant for v2 branch
;; where minimal menu toggle is broken at this moment
;; i will switch to it when that will be fixed

;; :branch :feat/v2
;; :config (fn [_ opts]
;;           (! (require :bento) :setup opts)
;;           (let [api (require :bento.api)]
;;             (api.register_expand_key ";")
;;             (api.register_last_buffer_key ";")
;;             (api.register_collapse_key :<Esc>)
;;             (api.register_prev_page_key "[")
;;             (api.register_next_page_key "]")
;;             (api.register_action :open {:key :<CR>
;;                                         :action api.actions.open
;;                                         :hl :DiagnosticVirtualTextHint})
;;             (api.register_action :delete {:key :<BS>
;;                                           :action api.actions.delete
;;                                           :hl :DiagnosticVirtualTextError})
;;             (api.register_action :vsplit {:key :<C-v>
;;                                           :action api.actions.vsplit
;;                                           :hl :DiagnosticVirtualTextInfo})
;;             (api.register_action :split {:key :<C-s>
;;                                          :action api.actions.split
;;                                          :hl :DiagnosticVirtualTextInfo})
;;             (api.register_action :lock {:key "*"
;;                                         :action api.actions.lock
;;                                         :hl :DiagnosticVirtualTextWarn})
;;             (api.set_default_action :open)))}
