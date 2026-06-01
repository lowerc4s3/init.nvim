(import-macros {: specmap : gh : cmd} :lib.macros)

;; magit flavored git client
{:src (gh :NeogitOrg/neogit)
 :dependencies {:src (gh :dlyongemallo/diffview.nvim)}
 :cmd :Neogit
 :opts {:disable_hint true
        :graph_style :unicode}
 :config (fn [_ opts]
           ((. (require :neogit) :setup) opts)
           ((. (require :which-key) :add) [{1 :<Leader>g :group :git}]))
 :keys [(specmap :n :<Leader>gg (cmd :Neogit) {:desc "open neogit tab"})
        (specmap :n :<Leader>gl (cmd "Neogit log") {:desc "view log"})
        (specmap :n :<Leader>gp (cmd "Neogit pull") {:desc :pull})
        (specmap :n :<Leader>gP (cmd "Neogit push") {:desc :push})]}
