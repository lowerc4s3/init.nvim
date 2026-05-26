(import-macros {: gh} :lib.macros)

;; better editing experience for lisp languages
{:src (gh :eraserhd/parinfer-rust)
 :build #(vim.system [:cargo :build :--release] {:cwd $.path} (fn []))}
