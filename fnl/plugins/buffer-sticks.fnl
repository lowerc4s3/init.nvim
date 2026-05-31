(import-macros {: gh : specmap} :lib.macros)

(macro link-hi [tbl]
  (collect [hi target (pairs tbl)]
    (values hi {:link target})))

;; buffer indicator and picker
{:src (gh :ahkohd/buffer-sticks.nvim)
 :lazy false
 :keys (specmap :n :<Tab> #(_G.BufferSticks.jump) {:desc "Jump to buffer"})
 :opts {:list {:keys {:close_buffer :<C-d>
                      :move_up :<C-k>
                      :move_down :<C-j>}
               :filter {:keys {:move_up :<C-k>
                               :move_down :<C-j>}
                        :title "/"}}
        :winblend 100
        :preview {:enabled false}
        :filter {:names ["^$"]} ; hide unnamed buffers
        :highlights (link-hi {:active :Normal
                              :list_selected "@function"
                              :alternate :Comment
                              :inactive :Comment
                              :active_modified :DiagnosticWarn
                              :alternate_modified :DiagnosticWarn
                              :inactive_modified :DiagnosticWarn
                              :label :Bold
                              :filter_title :Comment
                              :filter_selected "@function"})}}
