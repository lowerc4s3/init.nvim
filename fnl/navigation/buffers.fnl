(import-macros {: gh : map} :lib.macros)

(vim.pack.add [(gh :ahkohd/buffer-sticks.nvim)])

(let [opts {:list {:keys {:close_buffer :<C-d>
                          :move_up :<C-k>
                          :move_down :<C-j>}
                   :filter {:keys {:move_up :<C-k>
                                   :move_down :<C-j>}
                            :title "/"}}
            :winblend 100
            :filter {:names ["^$"]} ; hide unnamed buffers
            :highlights {:active {:link :Normal}
                         :list_selected {:link "@function"}
                         :alternate {:link :Comment}
                         :inactive {:link :Comment}
                         :active_modified {:link :DiagnosticWarn}
                         :alternate_modified {:link :DiagnosticWarn}
                         :inactive_modified {:link :DiagnosticWarn}
                         :label {:link :Bold}
                         :filter_title {:link :Comment}
                         :filter_selected {:link "@function"}}}]
  ((. (require :buffer-sticks) :setup) opts))

(map :n :<Tab> #(_G.BufferSticks.jump) {:desc "jump to buffer"})
