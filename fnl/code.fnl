(import-macros {: gh : map : cmd : plug} :lib.macros)
(local {: autocmd} (require :lib.nvim))
(local {: autoload} (require :nfnl.module))

(vim.pack.add [(gh :Olical/nfnl)
               (gh :eraserhd/parinfer-rust)
               (gh :lewis6991/gitsigns.nvim)
               (gh :dlyongemallo/diffview.nvim)
               (gh :NeogitOrg/neogit)
               (gh :stevearc/conform.nvim)])

;;;
;;; neogit
;;;

(let [neogit (require :neogit)
      opts {:disable_hint true}]
  (neogit.setup opts))

(map :n :<Leader>gg (cmd :Neogit) {:desc "open neogit tab"})
(map :n :<Leader>gl (cmd "Neogit log") {:desc "view log"})
(map :n :<Leader>gp (cmd "Neogit pull") {:desc :pull})
(map :n :<Leader>gP (cmd "Neogit push") {:desc :push})

;;;
;;; blink
;;;

(fn setup-blink []
  (vim.pack.add [(gh :xzbdmw/colorful-menu.nvim)
                 {:src (gh :saghen/blink.cmp) :version :v1}])
  (local blink (autoload :blink.cmp))
  (local col-menu (autoload :colorful-menu))
  (local icons (autoload :mini.icons))

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
                               #(tabout (plug :neotab-out))]
                       :<S-Tab> [#(if ($.is_visible) ($.select_prev)
                                      ($.snippet_active) ($.snippet_backward))
                                 #(tabout (plug :neotab-reverse))]}
              :cmdline {:completion {:menu {:auto_show true}
                                     :list {:selection {:preselect false
                                                        :auto_insert true}}}
                        :keymap {:<CR> [:accept_and_enter :fallback]}}}]
    (blink.setup opts)))

(autocmd [:InsertEnter :CmdLineEnter] {:once true :callback setup-blink})

;;;
;;; conform
;;;

;; NOTE: fnlfmt sometimes produces really stupid formatting
;; so the manual formatter call is prefered
(let [conform (require :conform)
      ignored-fts [:fennel]
      ignored-ft? (partial vim.tbl_contains ignored-fts)
      opts {:formatters_by_ft {:fennel [:fnlfmt]}
            :default_format_opts {:lsp_format :fallback}
            :format_on_save (fn [bufnr]
                              (when (not (ignored-ft? (. vim.bo bufnr :filetype)))
                                {:timeout_ms 500}))}]
  (conform.setup opts)
  (set vim.o.formatexpr "v:lua.require'conform'.formatexpr()"))
