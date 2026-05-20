;; bootstrap zpack (lazy.nvim inspired vim.pack wrapper)
(vim.pack.add ["https://github.com/zuqini/zpack.nvim"])

(let [zpack (require :zpack)] (zpack.setup))
