(import-macros {: gh : specmap : cmd} :lib.macros)

{:src (gh :DrKJeff16/project.nvim)
 :lazy false
 :keys (specmap :n :<Leader>sp (cmd "Project fzf-lua") {:desc "open project"})
 :opts {:fzf_lua {:enabled true :show :names}
        :scope_chdir :tab
        :lsp {:enabled false}}
 :config (fn [_ opts]
           ((. (require :project) :setup) opts))}
