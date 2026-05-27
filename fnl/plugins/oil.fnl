(import-macros {: gh : specmap : cmd} :lib.macros)

{:src (gh :stevearc/oil.nvim)
 :dependencies {:src (gh :nvim-mini/mini.icons)}
 :lazy false
 :opts {:keymaps {:gS {1 :actions.change_sort :mode :n}
                  :q {1 :actions.close :mode :n}}
        :delete_to_trash true
        :watch_for_changes true
        :constrain_cursor :name}
 :config (fn [_ opts]
           (let [oil (require :oil)]
             (oil.setup opts)))
 :keys [(specmap :n "-" (cmd :Oil) {:desc "open parent dir"})]}
