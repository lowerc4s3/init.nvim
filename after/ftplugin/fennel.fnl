(import-macros {: set+} :lib.macro)
(local {: maploclead : defgroup} (require :lib.map))
(local {: bo : g : opt_local : cmd : notify} vim)

;; treat `with-safely` macro as one taking the body
;; to use correct identation
(set+ opt_local.lispwords [:with-safely])

(let [width 2]
  (set bo.shiftwidth width)
  (set bo.tabstop width)
  (set bo.softtabstop width))

(defgroup "<LocalLeader>h" "hotpot" {:buf 0})
(maploclead "hl" #(cmd "Hotpot locate -- e")
            {:buf 0 :desc "open corresponding lua file"})
(maploclead "hv" #(cmd "Hotpot locate -- vsplit")
            {:buf 0 :desc "open corresponding lua file in vsplit"})
(maploclead "hs" #(cmd "Hotpot sync")
            {:buf 0 :desc "compile all fennel files"})
(let [toggle #(let [enabled? (= g.parinfer_enabled 1)
                    parinfer-command (.. "Parinfer" (if enabled? "Off" "On"))
                    msg (.. (if enabled? "disabled" "enabled") " parinfer")]
                (cmd parinfer-command)
                (notify msg))]
  (maploclead "p" toggle {:desc "toggle parinfer"}))
