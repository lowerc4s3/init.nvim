(import-macros {: gh} :lib.macro)
(local {: g : version : pack} vim)

;; enable lua module loader
(vim.loader.enable)

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

;; bootstrap fennel support
(pack.add [{:src (gh :rktjmp/hotpot.nvim) :version (version.range :^2.0.0)}])
(require :hotpot)

(require :core)
(when g.neovide (require :neovide))
(require :build-hooks)
(require :startup)
(require :ui)
(require :editor)
(require :navigation)
(require :lsp)
(require :code)
(require :highlights)
