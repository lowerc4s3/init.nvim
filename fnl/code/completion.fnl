(import-macros {: gh : plug : tx} :lib.macros)
(local {: autocmd} (require :lib.nvim))
(local {: autoload} (require :nfnl.module))

(fn callback []
  (vim.pack.add [(gh :xzbdmw/colorful-menu.nvim)
                 {:src (gh :saghen/blink.cmp) :version :v1}])

  (fn tabout [rhs]
    "for some reason neotab doesn't trigger when using lua api
    in blink keymap so we need to use the plug api instead"
    (vim.api.nvim_feedkeys (vim.keycode rhs) :i false)
    true)

  (let [col-menu (autoload :colorful-menu)
        icons (autoload :mini.icons)
        col-text #(col-menu.blink_components_text $)
        col-hl #(col-menu.blink_components_highlight $)
        get-kind-icon #(.. " " (icons.get :lsp $.kind) $.icon_gap)
        opts {:signature {:enabled true}
              :appearance {:nerd_font_variant :normal}
              :completion {:documentation {:auto_show true}
                           :ghost_text {:enabled false}
                           :list {:selection {:preselect false
                                              :auto_insert true}}
                           :menu {:draw {:columns [(tx :kind_icon)
                                                   (tx :label {:gap 1})]
                                         :padding 0
                                         :components {:label {:text col-text
                                                              :highlight col-hl}
                                                      :kind_icon {:text get-kind-icon}}}}}
              :sources {:default [:snippets :lsp :buffer]}
              :keymap {:preset :none
                       :<CR> [:select_and_accept :fallback]
                       :<C-b> [:scroll_documentation_up :fallback]
                       :<C-f> [:scroll_documentation_down :fallback]
                       :<C-e> [:cancel :fallback]
                       :<Tab> [#(if ($.is_visible) ($.select_next)
                                    ($.snippet_active) ($.accept))
                               #(tabout (plug :neotab-out))]
                       :<S-Tab> [#(if ($.is_visible) ($.select_prev)
                                      ($.snippet_active) ($.snippet_backward))
                                 #(tabout (plug :neotab-reverse))]}
              :cmdline {:completion {:menu {:auto_show true}
                                     :list {:selection {:preselect false
                                                        :auto_insert true}}}
                        :keymap {:<CR> [:accept_and_enter :fallback]}}}]
    ((. (require :blink.cmp) :setup) opts)))

(autocmd [:InsertEnter :CmdLineEnter] {:once true : callback})
