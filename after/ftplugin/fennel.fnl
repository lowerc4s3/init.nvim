(import-macros {: set+} :lib.macro)
(local {: maploclead} (require :lib.nvim))
(local {: bo : g : opt_local : cmd : notify} vim)

;; treat `with-safely` macro as one taking the body
;; to use correct identation
(set+ opt_local.lispwords [:with-safely])

(let [width 2]
  (set bo.shiftwidth width)
  (set bo.tabstop width)
  (set bo.softtabstop width))

(let [toggle #(let [enabled? (= g.parinfer_enabled 1)
                    parinfer-command (.. "Parinfer" (if enabled? "Off" "On"))
                    msg (.. (if enabled? "disabled" "enabled") " parinfer")]
                (cmd parinfer-command)
                (notify msg))]
  (maploclead "pt" toggle {:desc "toggle parinfer"}))
