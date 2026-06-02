(local {: autocmd} (require :lib.nvim))

(let [callback (fn [{:data {: kind : path :spec {: name}}}]
                 (print "kind = " kind ", path = " path ", spec.name = " name)
                 (when (and (= name :parinfer-rust)
                            (or (= kind :update) (= kind :install)))
                   (vim.system [:cargo :build :--release] {:cwd path} (fn []))))]
  (autocmd :PackChanged {: callback :desc "build parinfer-rust"}))
