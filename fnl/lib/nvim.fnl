;;;; this is basically a convenience module for
;;;; some neovim's apis which doesn't require macros.
(import-macros {: => : |} :lib.macro)

(local autocmd vim.api.nvim_create_autocmd)
(local augroup #(vim.api.nvim_create_augroup $1 (or $2 {})))
(local auclear vim.api.nvim_clear_autocmds)

(local map vim.keymap.set)
(local unmap vim.keymap.del)

(fn maplead [lhs rhs opts]
  "define a normal mode mapping starting with <Leader>"
  (map :n (.. "<Leader>" lhs) rhs opts))

(fn maploclead [lhs rhs opts]
  "define a normal mode mapping starting with <LocalLeader>"
  (map :n (.. "<LocalLeader>" lhs) rhs opts))

(fn defmapgroup [lhs desc]
  "define a which-key group"
  (=> (require :which-key) (add [(| lhs {:group desc})])))

(local hi (partial vim.api.nvim_set_hl 0))

{: autocmd
 : augroup
 : auclear
 : hi
 : map
 : maplead
 : maploclead
 : defmapgroup
 : unmap}
