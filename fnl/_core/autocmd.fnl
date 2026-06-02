(import-macros {: map : cmd} :lib.macros)

(local autocmd vim.api.nvim_create_autocmd)
(local augroup vim.api.nvim_create_augroup)

(local group (augroup :NuvimAutocmds {:clear true}))

(autocmd :FileType
         {: group
          :pattern [:help :qf :man]
          :desc "quit help pages with 'q'"
          :callback #(map :n :q (cmd :close) {:desc "Close help" :buf 0})})

(autocmd :TextYankPost
         {: group
          :callback #(vim.hl.on_yank {:higroup :Visual})})
