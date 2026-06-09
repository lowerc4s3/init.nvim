(import-macros {: gh : with-safely : | : =>} :lib.macro)
(local {: map} (require :lib.nvim))
(local {: pack} vim)

(with-safely :now
  (pack.add [(gh :eraserhd/parinfer-rust)
             (gh :lewis6991/gitsigns.nvim)]))
             

;;;
;;; neogit
;;;

(with-safely :later
  (pack.add [(gh :dlyongemallo/diffview.nvim)
             (gh :NeogitOrg/neogit)])
  (let [opts {:disable_hint true}]
    (=> (require :neogit) (setup opts)))

  (map :n :<Leader>gg "<cmd>Neogit<cr>") {:desc "open neogit tab"}
  (map :n :<Leader>gl "<cmd>Neogit log<cr>" {:desc "view log"})
  (map :n :<Leader>gp "<cmd>Neogit pull<cr>" {:desc :pull})
  (map :n :<Leader>gP "<cmd>Neogit push<cr>" {:desc :push}))

;;;
;;; blink
;;;

(with-safely [:on-event [:InsertEnter :CmdLineEnter]]
  (pack.add [(gh :xzbdmw/colorful-menu.nvim)
             {:src (gh :saghen/blink.cmp) :version :v1}])

  (local col-menu (require :colorful-menu))
  (local icons (require :mini.icons))

  (fn tabout [rhs]
    "for some reason neotab doesn't trigger when using lua api
    in blink keymap so we need to use the plug api instead"
    (vim.api.nvim_feedkeys (vim.keycode rhs) :i false)
    true)

  (let [col-text #(col-menu.blink_components_text $)
        col-hl #(col-menu.blink_components_highlight $)
        get-kind-icon #(.. " " (icons.get :lsp $.kind) $.icon_gap)
        opts {:signature {:enabled true}
              :appearance {:nerd_font_variant :normal}
              :completion {:documentation {:auto_show true}
                           :ghost_text {:enabled false}
                           :list {:selection {:preselect false
                                              :auto_insert true}}
                           :menu {:draw {:columns [{1 :kind_icon}
                                                   {1 :label :gap 1}]
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
                               #(tabout "<plug>(neotab-out)")]
                       :<S-Tab> [#(if ($.is_visible) ($.select_prev)
                                      ($.snippet_active) ($.snippet_backward))
                                 #(tabout "<plug>(neotab-reverse)")]}
              :cmdline {:completion {:menu {:auto_show true}
                                     :list {:selection {:preselect false
                                                        :auto_insert true}}}
                        :keymap {:<CR> [:accept_and_enter :fallback]}}}]
    (=> (require :blink.cmp) (setup opts))))

;;;
;;; conform
;;;

;; NOTE: fnlfmt sometimes produces really stupid formatting
;; so the manual formatter call is prefered
(with-safely :later
  (pack.add [(gh :stevearc/conform.nvim)])
  (let [ignored-fts [:fennel]
        ignored-ft? (partial vim.tbl_contains ignored-fts)
        opts {:formatters_by_ft {:fennel [:fnlfmt]}
              :default_format_opts {:lsp_format :fallback}
              :format_on_save (fn [bufnr]
                                (when (not (ignored-ft? (. vim.bo bufnr :filetype)))
                                  {:timeout_ms 500}))}]
    (=> (require :conform) (setup opts))
    (set vim.o.formatexpr "v:lua.require'conform'.formatexpr()")))
