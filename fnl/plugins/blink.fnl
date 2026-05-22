(import-macros {: gh} :lib.macros)
(local {: autoload} (require :nfnl.module))

{; completion engine
 :src (gh :saghen/blink.cmp)
 :dependencies {:src (gh :xzbdmw/colorful-menu.nvim)}
 :version :v1
 :event [:InsertEnter :CmdLineEnter]
 :opts (let [col-menu (autoload :colorful-menu)
             icons (autoload :mini.icons)
             neotab (autoload :neotab)
             col-text #(col-menu.blink_components_text $1)
             col-hl #(col-menu.blink_components_highlight $1)
             get-kind-icon #(.. " " (icons.get :lsp $1.kind) $1.icon_gap)]
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
                   :<Tab> [#(if ($1.is_visible) ($1.select_next)
                                ($1.snippet_active) ($1.accept)
                                (neotab.tabout))]
                   :<S-Tab> [#(if ($1.is_visible) ($1.select_prev)
                                  ($1.snippet_active) ($1.snippet_backward)
                                  (neotab.tabreverse))]}
          :cmdline {:completion {:menu {:auto_show true}
                                 :list {:selection {:preselect false
                                                    :auto_insert true}}}
                    :keymap {:<CR> [:accept_and_enter :fallback]}}})}
