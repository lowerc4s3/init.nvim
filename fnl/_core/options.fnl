(local opt vim.opt)
(local o vim.o)

;;; identation
(set o.expandtab true)
(set o.smarttab true) ; indent by shiftwidth
(set o.autoindent true)
(set o.smartindent true)
(let [spaces 4]
  (set o.tabstop spaces)
  (set o.softtabstop spaces)
  (set o.shiftwidth spaces))

;;; search
(set o.ignorecase true)
(set o.smartcase true)

;;; behavior
(set o.virtualedit :block) ; allow cursor to move where there is no text in visual block
(set o.splitright true)
(set o.splitbelow true)
(set o.mouse :a)
(set o.clipboard :unnamedplus) ; use system clipboard by default
(set o.timeoutlen 1000) ; wait 1 sec for keymap to complete

;;; file handling
(set o.swapfile false) ; no .swp files
(set o.updatetime 5000) ; write swapfile every 5 secs
(set o.undofile true) ; persistent undo
(opt.sessionoptions:prepend :globals)

;;; ui
(set o.termguicolors true)
(set o.number true)
(set o.relativenumber true) ; imagine not using this in vim
(set o.scrolloff 8)
(set o.sidescrolloff 8)
(set o.cursorline true) ; hl current line
(set o.title true)
(set o.winborder :none)
(set o.completeopt "menu,menuone,popup,noselect")
(set o.conceallevel 2) ; hide * markup for bold and italic, but not markers with substitutions
(set o.wrap false)
(set o.linebreak true) ; wrap lines at sensible points
(set o.foldlevel 999) ; don't fold automatically
(opt.guicursor:prepend ["a:Cursor"]) ; force cursor hl in all modes
(let [ui (require :vim._core.ui2)]
  (ui.enable {:msg {:target :msg}}))

;;; modeline
(set o.cmdheight 0)
(set o.ruler false) ; hide cursor position
(set o.showmode false) ; hide current mode indicator (--INSERT--)
(set o.showcmd false) ; hide visual mode selection
(set o.laststatus 2) ; 2 - statusline in each window, 3 - global statusline
(set o.signcolumn :yes) ; always show signcolumn
(opt.shortmess:append {:S true}) ; do not show search count message

;;; language
(set o.spelllang "en_us,ru")
(let [esc #(vim.fn.escape $ ";,.\"|\\]")
      en (esc "`qwertyuiop[]asdfghjkl;'zxcvbnm")
      ru (esc "ёйцукенгшщзхъфывапролджэячсмить")
      en-caps (esc "~QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>")
      ru-caps (esc "ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ")]
  (set o.langmap (.. ru-caps ";" en-caps "," ru ";" en)))
