(local {: autocmd} (require :lib.nvim))

(fn build-parinfer [{:data {: kind : path :spec {: name}}}]
  (when (and (= name :parinfer-rust) (or (= kind :update) (= kind :install)))
    (vim.system ["cargo" "build" "--release"] {:cwd path} (fn []))))

(let [callback (fn [e]
                 (build-parinfer e))]
  (autocmd :PackChanged {:desc "build plugins" : callback}))
