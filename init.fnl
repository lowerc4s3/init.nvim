(import-macros {: gh} :lib.macros)

;; enable lua module loader
(vim.loader.enable)

;; bootstrap fennel support
(vim.pack.add [(gh :Olical/nfnl)])

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
    (tset vim.g (.. :loaded_ plugin) 1)))

(require :core)
(require :pack)
