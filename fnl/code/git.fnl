(import-macros {: gh : map : cmd} :lib.macros)

(vim.pack.add [(gh :lewis6991/gitsigns.nvim)
               (gh :dlyongemallo/diffview.nvim)
               (gh :NeogitOrg/neogit)])

(let [opts {:disable_hint true}]
  ((. (require :neogit) :setup) opts))

(map :n :<Leader>gg (cmd "Neogit") {:desc "open neogit tab"})
(map :n :<Leader>gl (cmd "Neogit log") {:desc "view log"})
(map :n :<Leader>gp (cmd "Neogit pull") {:desc :pull})
(map :n :<Leader>gP (cmd "Neogit push") {:desc :push})
