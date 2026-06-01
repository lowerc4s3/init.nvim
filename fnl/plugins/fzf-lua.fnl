(import-macros {: gh : specmap : cmd} :lib.macros)

(macro fzf [command]
  (assert-compile (sym? command) "expected symbol for a command")
  `(cmd ,(.. :FzfLua " " (view command))))

;; fzf-based fuzzy picker
{:src (gh :ibhagwan/fzf-lua)
 :dependencies :nvim-mini/mini.icons
 :lazy false
 :opts {1 [:ivy :borderless :hide] ; enable presets
        :fzf_colors true
        :ui_select true
        :keymap {:fzf {1 true ; inherit default keymaps
                       :ctrl-A :toggle-all}}
        :actions {:files {1 true
                          :ctrl-h #(_G.FzfLua.actions.toggle_hidden $...)
                          :ctrl-Q #(_G.FzfLua.actions.file_sel_to_qf $...)
                          :alt-Q #(_G.FzfLua.actions.file_sel_to_ll $...)}}}
 :config (fn [_ opts]
           ((. (require :fzf-lua) :setup) opts)
           ((. (require :which-key) :add) [{1 :<Leader>s :group :search}
                                           {1 :<Leader>h :group :help}]))
 :keys [(specmap :n :<Leader><Leader> (fzf files) {:desc "open cwd file"})
        (specmap :n "<Leader>," (fzf buffers) {:desc "switch buffer"})
        (specmap :n "<Leader>'" (fzf resume) {:desc "resume last search"})
        (specmap :n :<Leader>sf (fzf files) {:desc "cwd file"})
        (specmap :n :<Leader>sb (fzf buffers) {:desc :buffer})
        (specmap :n :<Leader>sw (fzf live_grep) {:desc "live grep"})
        (specmap :n :<Leader>sr (fzf history) {:desc "recent file"})
        (specmap :n :<Leader>ss (fzf builtin) {:desc "select picker"})
        (specmap :n :<Leader>hh (fzf helptags) {:desc :helptags})
        (specmap :n :<Leader>hk (fzf keymaps) {:desc :keymaps})
        (specmap :n :<Leader>ho (fzf nvim_options) {:desc :options})
        (specmap :n :<Leader>hH (fzf highlights) {:desc :highlights})]}
