(import-macros {: reqfn} :lib.macros)

((reqfn :vim._core.ui2 :enable) {:enable true :msg {:target :msg}})

(let [o vim.opt]
  ;;; editor
  (set o.expandtab true)
  (set o.smarttab true) ; indent by shiftwidth
  (set o.autoindent true)
  (let [spaces 4]
    (set o.tabstop spaces)
    (set o.softtabstop spaces)
    (set o.shiftwidth spaces))
  (set o.splitright true)
  (set o.splitbelow true)
  (set o.number true)
  (set o.relativenumber true) ; imagine not using this in vim
  (set o.clipboard :unnamedplus) ; use system clipboard by default
  (set o.mouse :a)
  (set o.ignorecase true)
  (set o.smartcase true)
  (set o.updatetime 5000) ; write swapfile every 5 secs
  (set o.timeoutlen 1000) ; wait 1 sec for keymap to complete
  (set o.scrolloff 8)
  (set o.sidescrolloff 8)
  (set o.foldlevel 999) ; don't fold automatically
  (set o.wrap false)
  (o.sessionoptions:prepend :globals)
  ;;; ui
  (set o.termguicolors true)
  (set o.cursorline true) ; hl current line
  (set o.title true)
  (set o.winborder :none)
  (o.guicursor:prepend ["a:Cursor"]) ; force cursor hl in all modes
  ;;; modeline
  (set o.ruler false) ; hide cursor position
  (set o.showmode false) ; hide current mode indicator (--INSERT--)
  (set o.showcmd false) ; hide visual mode selection
  (set o.laststatus 2) ; 2 - statusline in each window, 3 - global statusline
  ;; hide search count message and "search hit BOTTOM, continuing at TOP"
  (o.shortmess:append {:S true :s true})
  ;;; language
  (set o.spelllang "en_us,ru")
  (let [esc #(vim.fn.escape $1 ";,.\"|\\]")
        en (esc "`qwertyuiop[]asdfghjkl;'zxcvbnm")
        ru (esc "ёйцукенгшщзхъфывапролджэячсмить")
        en-caps (esc "~QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>")
        ru-caps (esc "ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ")]
    (set o.langmap (.. ru-caps ";" en-caps "," ru ";" en))))
