;;;; this is basically a convenience module for
;;;; some neovim's apis which doesn't require macros.
(import-macros {: => : |} :lib.macro)

(local autocmd vim.api.nvim_create_autocmd)
(local augroup #(vim.api.nvim_create_augroup $1 (or $2 {})))
(local auclear vim.api.nvim_clear_autocmds)

(local hi (partial vim.api.nvim_set_hl 0))

(fn mnw-packadd [& plugins]
  (each [_ plugin (ipairs plugins)]
    (let [url (case plugin
                {: src} src
                (where src (= (type src) :string)) src)
          name (url:match "([^/]+)$")]
      (vim.cmd.packadd name))))

(fn vim-packadd [& plugins]
  (vim.pack.add plugins))

(local packadd (if (not= _G.mnw nil) mnw-packadd vim-packadd))

{: autocmd
 : augroup
 : auclear
 : hi
 : packadd}
