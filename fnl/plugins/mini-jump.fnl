(import-macros {: gh} :lib.macros)

;; repeat f/F/t/T to search letters (clever-f style)
{:src (gh :nvim-mini/mini.jump)
 :config (fn []
           ((. (require :mini.jump) :setup))
           (vim.api.nvim_set_hl 0 :MiniJump {:link :CurSearch}))}
