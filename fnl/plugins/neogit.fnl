(import-macros {: specmap : gh : cmd : !} :lib.macros)

{:src (gh :NeogitOrg/neogit)
 :dependencies [{:src (gh :sindrets/diffview.nvim)}]
 :cmd :Neogit
 :config #(! (require :which-key) :add [{1 :<Leader>g :group :git}])
 :keys [(specmap :n :<Leader>gg (cmd :Neogit) {:desc "open neogit tab"})
        (specmap :n :<Leader>gl (cmd "Neogit log") {:desc "view log"})
        (specmap :n :<Leader>gp (cmd "Neogit pull") {:desc :pull})
        (specmap :n :<Leader>gP (cmd "Neogit push") {:desc :push})]}
