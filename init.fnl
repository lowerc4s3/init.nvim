;; enable lua module loader
(vim.loader.enable)

(import-macros {: gh} :lib.macro)
(local autocmd vim.api.nvim_create_autocmd)
(local {: g : version : pack} vim)

;; disable unused builtin plugins
(let [builtins [:gzip
                :zip
                :zipPlugin
                :tar
                :tarPlugin
                :getscript
                :getscriptPlugin
                :vimball
                :vimballPlugin
                :2html_plugin
                :logipat
                :rrhelper
                :spellfile_plugin
                :matchit]]
  (each [_ plugin (ipairs builtins)]
    (tset g (.. :loaded_ plugin) 1)))

;;;
;;; plugin build hooks
;;;

(fn build-parinfer [{: kind : path :spec {: name}}]
  (when (and (= name :parinfer-rust) (or (= kind :update) (= kind :install)))
    (vim.system ["cargo" "build" "--release"] {:cwd path} (fn []))))

(fn build-hooks [{: data}]
  (build-parinfer data))

(autocmd :PackChanged {:desc "build plugins" :callback build-hooks})

;; bootstrap fennel support
(pack.add [{:src (gh :rktjmp/hotpot.nvim) :version (version.range :^2.0.0)}])
(require :hotpot)

;;;
;;; modules
;;;

(require :core)
(when g.neovide (require :neovide))

(require :startup)
(require :ui)
(require :editor)
(require :navigation)
(require :lsp)
(require :code)
(require :highlights)
