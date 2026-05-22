(import-macros {: specmap : gh : cmd} :lib.macros)

{:src (gh :NeogitOrg/neogit)
 :dependencies [{:src (gh :sindrets/diffview.nvim)}]
 :cmd :Neogit
 :keys [(specmap :n :<Leader>gg (cmd :Neogit) {:desc "open neogit tab"})
        (specmap :n :<Leader>gl (cmd "Neogit log") {:desc "view log"})
        (specmap :n :<Leader>gp (cmd "Neogit pull") {:desc :pull})
        (specmap :n :<Leader>gP (cmd "Neogit push") {:desc :push})]}
        
 ; :config (fn []
 ;           (map :n :<Leader>gg (cmd :Neogit) {:desc "open neogit tab"})
 ;           (map :n :<Leader>gl (cmd "Neogit log") {:desc "view log"})
 ;           (map :n :<Leader>gp (cmd "Neogit pull") {:desc :pull})
 ;           (map :n :<Leader>gP (cmd "Neogit push") {:desc :push}))}
