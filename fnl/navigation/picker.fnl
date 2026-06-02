(import-macros {: gh : map} :lib.macros)

(vim.pack.add [(gh :nvim-mini/mini.icons)
               (gh :ibhagwan/fzf-lua)
               (gh :DrKJeff16/project.nvim)])

(let [opts {1 [:ivy :borderless :hide]
            :fzf_colors true
            :keymap {:fzf {1 true :ctrl-A :toggle-all}}
            :actions {:files {1 true
                              :ctrl-h #(_G.FzfLua.actions.toggle_hidden $...)
                              :ctrl-Q #(_G.FzfLua.actions.file_sel_to_qf $...)
                              :alt-Q #(_G.FzfLua.actions.file_sel_to_ll $...)}}}]
  ((. (require :fzf-lua) :setup) opts))

(let [opts {:fzf_lua {:enabled true :show :names}
            :scope_chdir :tab
            :lsp {:enabled false}}]
  ((. (require :project) :setup) opts))

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
