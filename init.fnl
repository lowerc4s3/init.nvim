;; enable lua module loader
(vim.loader.enable)

(import-macros {: gh} :lib.macro)
(local autocmd vim.api.nvim_create_autocmd)
(local {: g : version} vim)

;; set global mnw check
(set _G.mnw? (not= _G.mnw nil))

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
    (tset g (.. "loaded_" plugin) 1)))

(let [providers [:python3 :node :ruby :perl]]
  (each [_ provider (ipairs providers)]
    (tset g (.. "loaded_" provider "_provider") 0)))

;;;
;;; plugin build hooks
;;;

;; NOTE: lib.nvim module already contains packadd function
;; which handles mnw but since we haven't yet loaded hotpot
;; we can't require that module yet
(when (not _G.mnw?)
  (fn build-parinfer [{: kind : path :spec {: name}}]
    (when (and (= name :parinfer-rust) (or (= kind :update) (= kind :install)))
      (vim.system ["cargo" "build" "--release"] {:cwd path} (fn []))))

  (fn build-hooks [{: data}]
    (build-parinfer data))

  (autocmd :PackChanged {:desc "build plugins" :callback build-hooks})

  ;; bootstrap fennel support
  (vim.pack.add [{:src (gh :rktjmp/hotpot.nvim) :version (version.range "^2.0.0")}])
  (require :hotpot))

;;;
;;; modules
;;;

(require :startup)
(require :core)
(when g.neovide (require :neovide))

(require :ui)
(require :editor)
(require :navigation)
(require :lsp)
(require :code)
(require :highlights)
