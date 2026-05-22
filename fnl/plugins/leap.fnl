(import-macros {: map : plug : cb} :lib.macros)

{; search labels navigation
 :src (cb :andyg/leap.nvim)
 :dependencies :tpope/vim-repeat
 :config (fn []
           (map :nxo :s (plug :leap))
           (map :n :S (plug :leap-from-window))
           (map :xo :ar (plug :leap-remote-text-object))
           (map :xo :ir (plug :leap-remote-inner-text-object)))}
