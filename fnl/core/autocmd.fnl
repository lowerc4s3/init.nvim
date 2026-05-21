(import-macros {: map : cmd} :lib.macros)
(local autocmd vim.api.nvim_create_autocmd)

(autocmd :FileType
         {:pattern [:help :qf :man]
          :desc "quit help pages with 'q'"
          :callback #(map :n :q (cmd :close) {:desc "Close help" :buf 0})})
