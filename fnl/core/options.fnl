(local opt vim.opt)

(let [ui (require :vim._core.ui2)]
  (ui.enable {:msg {:target :msg}}))

;;; editor
(set opt.expandtab true)
(set opt.smarttab true) ; indent by shiftwidth
(set opt.autoindent true)

(let [spaces 4]
  (set opt.tabstop spaces)
  (set opt.softtabstop spaces)
  (set opt.shiftwidth spaces))

(set opt.splitright true)
(set opt.splitbelow true)
(set opt.number true)
(set opt.relativenumber true) ; imagine not using this in vim
(set opt.clipboard :unnamedplus) ; use system clipboard by default
(set opt.mouse :a)
(set opt.ignorecase true)
(set opt.smartcase true)
(set opt.updatetime 5000) ; write swapfile every 5 secs
(set opt.timeoutlen 1000) ; wait 1 sec for keymap to complete
(set opt.scrolloff 8)
(set opt.sidescrolloff 8)
(set opt.foldlevel 999) ; don't fold automatically
(set opt.wrap false)
(opt.sessionoptions:prepend :globals)

;;; ui
(set opt.termguicolors true)
(set opt.cursorline true) ; hl current line
(set opt.title true)
(set opt.winborder :none)
(opt.guicursor:prepend ["a:Cursor"]) ; force cursor hl in all modes

;;; modeline
(set opt.ruler false) ; hide cursor position
(set opt.showmode false) ; hide current mode indicator (--INSERT--)
(set opt.showcmd false) ; hide visual mode selection
(set opt.laststatus 2) ; 2 - statusline in each window, 3 - global statusline
(set opt.signcolumn :yes) ; always show signcolumn
(opt.shortmess:append {:S true} ; do not show search count message
                     :s true) ; don't give "search hit BOTTOM, continuing at TOP"

;;; language
(set opt.spelllang "en_us,ru")
(let [esc #(vim.fn.escape $ ";,.\"|\\]")
      en (esc "`qwertyuiop[]asdfghjkl;'zxcvbnm")
      ru (esc "ёйцукенгшщзхъфывапролджэячсмить")
      en-caps (esc "~QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>")
      ru-caps (esc "ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ")]
  (set opt.langmap (.. ru-caps ";" en-caps "," ru ";" en)))
