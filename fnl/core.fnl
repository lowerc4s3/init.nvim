(import-macros {: cmd : map} :lib.macros)
(local {: autocmd : augroup} (require :lib.nvim))
(local {: g : o : opt} vim)

;;;
;;; options
;;;

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

;;;
;;; keymaps
;;;

(set g.mapleader " ")
(set g.maplocalleader ",")

(map :nvo :<Space> :<Nop>)
(map :n :<Esc> (cmd "nohlsearch") {:desc "disable search hl"})

;; helix like $ and ^ shortcuts
(map :nvo :gl "$" {:desc "to the end of the line"})
(map :nvo :gh "^" {:desc "to the first non-blank character of the line"})

;; don't leave visual mode when indenting
(map :v "<" :<gv)
(map :v ">" :>gv)

;; window traversal shortcuts
(map :n :<C-h> :<C-w>h {:desc "move to the left window"})
(map :n :<C-j> :<C-w>j {:desc "move to the lower window"})
(map :n :<C-k> :<C-w>k {:desc "move to the upper window"})
(map :n :<C-l> :<C-w>l {:desc "move to the right window"})

(map :i :<C-h> :<Left> {:desc "move left"})
(map :i :<C-j> :<Down> {:desc "move down"})
(map :i :<C-k> :<Up> {:desc "move up"})
(map :i :<C-l> :<Right> {:desc "move right"})

;;;
;;; autocmds
;;;

(let [group (augroup :NuvimAutocmds {:clear true})]
  (autocmd :FileType
           {: group
            :pattern [:help :qf :man]
            :desc "quit help pages with 'q'"
            :callback #(map :n :q (cmd :close) {:desc "Close help" :buf 0})})
  (autocmd :TextYankPost
           {: group :callback #(vim.hl.on_yank {:higroup :Visual})}))
