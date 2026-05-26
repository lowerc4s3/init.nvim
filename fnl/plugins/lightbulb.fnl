(import-macros {: gh} :lib.macros)

;; code action indicator
{:src (gh :kosayoda/nvim-lightbulb)
 :event :LspAttach
 :opts {:sign {:text ""}}}
