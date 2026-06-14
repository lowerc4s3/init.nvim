;;;; this is basically a convenience module for
;;;; some neovim's apis which doesn't require macros.
(import-macros {: => : |} :lib.macro)

(local autocmd vim.api.nvim_create_autocmd)
(local augroup #(vim.api.nvim_create_augroup $1 (or $2 {})))
(local auclear vim.api.nvim_clear_autocmds)

(local hi (partial vim.api.nvim_set_hl 0))

{: autocmd
 : augroup
 : auclear
 : hi}
