(import-macros {: gh} :lib.macros)

;; NOTE: let zpack know manage nfnl. vim.pack call in init.fnl is required
;; to use nfnl's stdlib (for some reason require calls fail when that call is
;; absent)
{:src (gh :Olical/nfnl)}

;; TODO: add localleader binds
