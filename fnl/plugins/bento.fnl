(import-macros {: gh} :lib.macros)

{:src (gh :lowerc4s3/bento.nvim)
 :branch :v2/bugfix
 :opts {:ui {:floating {:minimal_menu :dashed}}
        :lock_char ""
        :map_last_accessed true
        :max_open_buffers 8
        :ordering_metric :filename}
 :config (fn [_ opts]
           (let [bento (require :bento)
                 api (require :bento.api)]
             (bento.setup opts)
             (api.register_expand_key :<Tab>)
             (api.register_last_buffer_key :<Tab>)
             (api.register_collapse_key :<Esc>)
             (api.register_prev_page_key "[")
             (api.register_next_page_key "]")
             (api.register_action :open {:key :<CR>
                                         :action api.actions.open
                                         :hl :DiagnosticVirtualTextHint})
             (api.register_action :delete {:key :<C-d>
                                           :action api.actions.delete
                                           :hl :DiagnosticVirtualTextError})
             (api.register_action :vsplit {:key :<C-v>
                                           :action api.actions.vsplit
                                           :hl :DiagnosticVirtualTextInfo})
             (api.register_action :split {:key :<C-s>
                                          :action api.actions.split
                                          :hl :DiagnosticVirtualTextInfo})
             (api.register_action :lock {:key "*"
                                         :action api.actions.lock
                                         :hl :DiagnosticVirtualTextWarn})
             (api.set_default_action :open)))}
