(import-macros {: gh : map : cmd} :lib.macros)

(vim.pack.add [(gh :nvim-mini/mini.icons)
               (gh :stevearc/oil.nvim)])

(let [opts {:keymaps {:gS {1 :actions.change_sort :mode :n}
                      :q {1 :actions.close :mode :n}}
            :delete_to_trash true
            :watch_for_changes true
            :constrain_cursor :name}]
  ((. (require :oil) :setup) opts))

(map :n "-" (cmd "Oil") {:desc "open parent dir"})
