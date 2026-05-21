(import-macros {: map : plug : cb} :macros)
(local {: autoload} (require :nfnl.module))

{; ui2 fuzzy picker 
 :src (cb :comfysage/artio.nvim)
 :dependencies :nvim-mini/mini.icons
 :config #(let [artio (require :artio)]
            (artio.setup {:opts {:bottom false :shrink false :marker "*"}
                          :mappings {:<C-j> :down
                                     :<C-n> :down
                                     :<C-k> :up
                                     :<C-p> :up
                                     :<Enter> :accept
                                     :<Tab> :accept
                                     :<C-m> :mark
                                     :<Esc> :cancel
                                     :<C-g> :togglelive
                                     :<C-l> :togglepreview
                                     :<C-s> :split
                                     :<C-v> :vsplit
                                     :<C-t> :tabnew}})
            (set vim.ui.select artio.select)
            (let [pick (autoload :artio.builtins)
                  findprg "fd --full-path --absolute-path --type f --color=never --"
                  grepprg "rg --color=never --no-heading --with-filename --line-number --column --smart-case"]
              (map :n :<Leader>ff #(pick.files {: findprg}) {:desc "open file"})
              (map :n :<Leader><Leader> #(pick.files {: findprg})
                   {:desc "open file"})
              (map :n :<Leader>fw #(pick.grep {: grepprg}) {:desc "live grep"})
              (map :n :<Leader>fb pick.buffers {:desc "switch buffer"})
              (map :n "<Leader>," pick.buffers {:desc "switch buffer"})
              (map :n :<Leader>fr pick.oldfiles {:desc "open recent file"})))}
