(import-macros {: with-safely : gh : =>} :lib.macro)
(local {: maploclead : defgroup} (require :lib.map))
(local {: bo : pack : version : cmd} vim)

(let [width 2]
  (set bo.shiftwidth width)
  (set bo.tabstop width)
  (set bo.softtabstop width))

(with-safely :now
  (pack.add [{:src (gh :chomosuke/typst-preview.nvim)
              :version (version.range "v1.*")}])
  (let [opts {:dependencies_bin {:websocat "websocat" :tinymist "tinymist"}}]
    (=> (require :typst-preview) (setup opts))))


(defgroup "<LocalLeader>p" "preview" {:buf 0})
(maploclead "pt" #(cmd "TypstPreviewToggle") {:desc "toggle preview"})
