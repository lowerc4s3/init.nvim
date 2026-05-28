(local opt vim.opt)

(vim.cmd.colorscheme :catppuccin)

;;; identation
(set opt.expandtab true)
(set opt.smarttab true) ; indent by shiftwidth
(set opt.autoindent true)
(set opt.smartindent true)
(let [spaces 4]
  (set opt.tabstop spaces)
  (set opt.softtabstop spaces)
  (set opt.shiftwidth spaces))

;;; search
(set opt.ignorecase true)
(set opt.smartcase true)

;;; behavior
(set opt.virtualedit [:block]) ; allow cursor to move where there is no text in visual block
(set opt.splitright true)
(set opt.splitbelow true)
(set opt.mouse :a)
(set opt.clipboard :unnamedplus) ; use system clipboard by default
(set opt.timeoutlen 1000) ; wait 1 sec for keymap to complete

;;; file handling
(set opt.swapfile false) ; no .swp files
(set opt.updatetime 5000) ; write swapfile every 5 secs
(set opt.undofile true) ; persistent undo
(opt.sessionoptions:prepend :globals)

;;; ui
(set opt.termguicolors true)
(set opt.number true)
(set opt.relativenumber true) ; imagine not using this in vim
(set opt.scrolloff 8)
(set opt.sidescrolloff 8)
(set opt.cursorline true) ; hl current line
(set opt.title true)
(set opt.winborder :none)
(set opt.completeopt [:menu :menuone :popup :noselect])
(set opt.conceallevel 2) ; hide * markup for bold and italic, but not markers with substitutions
(set opt.wrap false)
(set opt.linebreak true) ; wrap lines at sensible points
(set opt.foldlevel 999) ; don't fold automatically
(opt.guicursor:prepend ["a:Cursor"]) ; force cursor hl in all modes
(let [ui (require :vim._core.ui2)]
  (ui.enable {:msg {:target :msg}}))

;;; modeline
(set opt.cmdheight 0)
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
