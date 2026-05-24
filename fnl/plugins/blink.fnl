(import-macros {: gh : plug} :lib.macros)
(local {: autoload} (require :nfnl.module))

(macro tabout [rhs]
  "for some reason neotab doesn't trigger when using lua api
  in blink keymap so we need to use the plug api instead"
  `(let [key# (vim.api.nvim_replace_termcodes ,rhs true true true)]
     (vim.api.nvim_feedkeys key# :i false)
     true))

{; completion engine
 :src (gh :saghen/blink.cmp)
 :dependencies [{:src (gh :xzbdmw/colorful-menu.nvim)}
                {:src (gh :kawre/neotab.nvim)}]
 :version :v1
 :event [:InsertEnter :CmdLineEnter]
 :opts (let [col-menu (autoload :colorful-menu)
             icons (autoload :mini.icons)
             col-text #(col-menu.blink_components_text $)
             col-hl #(col-menu.blink_components_highlight $)
             get-kind-icon #(.. " " (icons.get :lsp $.kind) $.icon_gap)]
         {:signature {:enabled true}
          :appearance {:nerd_font_variant :normal}
          :completion {:documentation {:auto_show true}
                       :ghost_text {:enabled false}
                       :list {:selection {:preselect false :auto_insert true}}
                       :menu {:draw {:columns [{1 :kind_icon}
                                               {1 :label :gap 1}]
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
                    :keymap {:<CR> [:accept_and_enter :fallback]}}})}
