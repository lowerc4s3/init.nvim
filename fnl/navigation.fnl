(import-macros {: gh : map : cmd} :lib.macros)

(vim.pack.add [(gh :stevearc/oil.nvim)
               (gh :ibhagwan/fzf-lua)
               (gh :ahkohd/buffer-sticks.nvim)
               (gh :DrKJeff16/project.nvim)])

(let [oil (require :oil)
      opts {:delete_to_trash true
            :watch_for_changes true
            :constrain_cursor :name
            :keymaps {:gS {1 :actions.change_sort :mode :n}
                      :q {1 :actions.close :mode :n}
                      :<C-h> false
                      :<C-s> {1 :actions.select :opts {:horizontal true}}
                      :<C-v> {1 :actions.select :opts {:vertical true}}}}]
  (oil.setup opts))

(map :n "-" (cmd "Oil") {:desc "open parent dir"})

;;;
;;; fzf-lua
;;;

(let [fzf (require :fzf-lua)
      opts {1 [:ivy :borderless :hide]
            :fzf_colors true
            :keymap {:fzf {1 true :ctrl-A :toggle-all}}
            :actions {:files {1 true
                              :ctrl-h #(_G.FzfLua.actions.toggle_hidden $...)
                              :ctrl-Q #(_G.FzfLua.actions.file_sel_to_qf $...)
                              :alt-Q #(_G.FzfLua.actions.file_sel_to_ll $...)}}}]
  (fzf.setup opts))

(let [fzf _G.FzfLua]
  (map :n :<Leader><Leader> (fzf.files) {:desc "open cwd file"})
  (map :n "<Leader>," (fzf.buffers) {:desc "switch buffer"})
  (map :n "<Leader>'" (fzf.resume) {:desc "resume last search"})
  (map :n :<Leader>sf (fzf.files) {:desc "cwd file"})
  (map :n :<Leader>sb (fzf.buffers) {:desc :buffer})
  (map :n :<Leader>sw (fzf.live_grep) {:desc "live grep"})
  (map :n :<Leader>sr (fzf.history) {:desc "recent file"})
  (map :n :<Leader>ss (fzf.builtin) {:desc "select picker"})
  (map :n :<Leader>hh (fzf.helptags) {:desc :helptags})
  (map :n :<Leader>hk (fzf.keymaps) {:desc :keymaps})
  (map :n :<Leader>ho (fzf.nvim_options) {:desc :options})
  (map :n :<Leader>hH (fzf.highlights) {:desc :highlights}))

;;;
;;; buffer-sticks
;;;

(let [buffer-sticks (require :buffer-sticks)
      opts {:list {:keys {:close_buffer :<C-d>
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
  (buffer-sticks.setup opts))

(map :n :<Tab> #(_G.BufferSticks.jump) {:desc "jump to buffer"})

;;;
;;; project
;;;

(let [project (require :project)
      opts {:fzf_lua {:enabled true :show :names}
            :scope_chdir :tab
            :lsp {:enabled false}}]
  (project.setup opts))
