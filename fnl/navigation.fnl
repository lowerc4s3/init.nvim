(import-macros {: gh : with-safely : | : =>} :lib.macro)
(local {: map : defmapgroup} (require :lib.nvim))
(local {: pack} vim)

(with-safely :now
  (pack.add [(gh :stevearc/oil.nvim)])
  (let [opts {:delete_to_trash true
              :watch_for_changes true
              :constrain_cursor :name
              :keymaps {"gS" {1 :actions.change_sort :mode :n}
                        "q" {1 :actions.close :mode :n}
                        "<C-h>" false
                        "<C-s>" {1 :actions.select :opts {:horizontal true}}
                        "<C-v>" {1 :actions.select :opts {:vertical true}}}}]
    (=> (require :oil) (setup opts)))
  (map :n "-" "<cmd>Oil<cr>" {:desc "open parent dir"}))

;;;
;;; snacks.picker
;;;

;; snacks initializes ridiculously fast
;; so there's no need to lazy-load it
(with-safely :now
  (pack.add [(gh :folke/snacks.nvim)])
  (let [opts {:prompt "  "
              :layout {:preset :ivy_split}
              :win {:input {:keys {"<Esc>" (| :close {:mode [:n :i]})
                                   "<C-h>" (| :toggle_hidden {:mode [:n :i]})
                                   "<C-i>" (| :toggle_ignored {:mode [:n :i]})
                                   "<C-l>" (| :toggle_live {:mode [:n :i]})}}}
              :icons {:ui {:live "[live]"}}}]
    (=> (require :snacks) (setup {:picker opts})))
  (let [pick _G.Snacks.picker]
    (defmapgroup "<Leader>s" "search")
    (map :n "<Leader><Leader>" pick.files {:desc "open cwd file"})
    (map :n "<Leader>," pick.buffers {:desc "switch buffer"})
    (map :n "<Leader>'" pick.resume {:desc "resume last search"})
    (map :n "<Leader>sf" pick.files {:desc "cwd file"})
    (map :n "<Leader>sb" pick.buffers {:desc :buffer})
    (map :n "<Leader>sw" pick.grep {:desc "live grep"})
    (map :n "<Leader>sr" pick.recent {:desc "recent file"})
    (map :n "<Leader>ss" pick.pickers {:desc "select picker"})

    (defmapgroup "<Leader>h" "help")
    (map :n "<Leader>hh" pick.help {:desc :helptags})
    (map :n "<Leader>hk" pick.keymaps {:desc :keymaps})
    (map :n "<Leader>hH" pick.highlights {:desc :highlights})))

;;;
;;; project.nvim
;;;

(with-safely :later
  (pack.add [(gh :DrKJeff16/project.nvim)])
  (let [opts {:snacks {:enabled true :opts {:show :names}}
              :scope_chdir :tab
              :lsp {:enabled false}}]
    (=> (require :project) (setup opts)))
  (map :n "<Leader>sp" "<cmd>Project snacks<cr>" {:desc "project"}))

;;;
;;; buffer-sticks
;;;

(with-safely :now
  ;; NOTE: ahkohd/buffer-sticks.nvim 
  ;; is currently broken on nightly  
  ;; so we use a fork with a fix
  (pack.add [(gh :JustBarnt/buffer-sticks.nvim)])
  (let [opts {:list {:keys {:close_buffer "<C-d>"
                            :move_up "<C-k>"
                            :move_down "<C-j>"}
                     :filter {:keys {:move_up "<C-k>" :move_down "<C-j>"}
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
    (=> (require :buffer-sticks) (setup opts)))
  (map :n "<Tab>" #(_G.BufferSticks.jump) {:desc "jump to buffer"}))
