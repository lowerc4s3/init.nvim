(import-macros {: map! : set! : cmd : =>} :lib.macro)
(local {: autocmd : augroup} (require :lib.nvim))

;;;
;;; options
;;;

; ;;; identation
(set! expandtab)
(set! smarttab)
(set! autoindent)
(let [width 4]
  (set! tabstop width)
  (set! softtabstop width)
  (set! shiftwidth width))

; ;;; search
(set! ignorecase)
(set! smartcase)

; ;;; behavior
(set! virtualedit :block) ; allow cursor to move where there is no text in visual block
(set! splitright)
(set! splitbelow)
(set! mouse :a)
(set! clipboard :unnamedplus) ; use system clipboard by default
(set! timeoutlen 1000) ; wait 1 sec for keymap to complete

;;; file handling
(set! noswapfile) ; no .swp files
(set! updatetime 5000) ; write swapfile every 5 secs
(set! undofile) ; persistent undo
(set! sessionoptions^ :globals)

;;; ui
(set! termguicolors)
(set! number)
(set! relativenumber)
(set! scrolloff 8)
(set! sidescrolloff 8)
(set! cursorline)
(set! title)
(set! winborder :none)
(set! completeopt "menu,menuone,popup,noselect")
(set! conceallevel 2) ; hide * markup for bold and italic, but not markers with substitutions
(set! nowrap)
(set! linebreak) ; wrap lines at sensible points
(set! foldlevel 999) ; don't fold automatically
(set! guicursor^ "a:Cursor") ; force cursor hl in all modes
(=> (require :vim._core.ui2) (enable {:msg {:target :msg}})) ; enable new msg ui

;;; statusline
(set! cmdheight 0)
(set! noruler) ; hide cursor position
(set! noshowmode) ; hide current mode indicator (--INSERT--)
(set! noshowcmd) ; hide visual mode selection
(set! laststatus 2) ; 2 - statusline in each window, 3 - global statusline
(set! signcolumn :yes) ; always show signcolumn
(set! shortmess+ {:S true}) ; do not show search count message

;;; language
(set! spelllang "en_us,ru")
(let [esc #(vim.fn.escape $ ";,.\"|\\]")
      en (esc "`qwertyuiop[]asdfghjkl;'zxcvbnm")
      ru (esc "ёйцукенгшщзхъфывапролджэячсмить")
      en-caps (esc "~QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>")
      ru-caps (esc "ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ")]
  (set! langmap (.. ru-caps ";" en-caps "," ru ";" en)))


;;;
;;; keymaps
;;;

(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

(map! [nvo &silent] :<Space> :<Nop>)
(map! [n &desc "disable search hl"] :<Esc> (cmd "nohlsearch"))

; ;; helix like $ and ^ shortcuts
(map! [nvo &desc "to the end of the line"] "gl" "$")
(map! [nvo &desc "to the first non-blank character of the line"] "gh" "^")

(map! [v] "<" "<gv")
(map! [v] ">" ">gv")

(map! [n &desc "move to the left window"] :<C-h> "<C-w>h")
(map! [n &desc "move to the lower window"] :<C-j> "<C-w>j")
(map! [n &desc "move to the upper window"] :<C-k> "<C-w>k")
(map! [n &desc "move to the right window"] :<C-l> "<C-w>l")

(map! [i &desc "move left"] :<C-h> :<Left>)
(map! [i &desc "move down"] :<C-j> :<Up>)
(map! [i &desc "move up"] :<C-k> :<Down>)
(map! [i &desc "move right"] :<C-l> :<Right>)

;;;
;;; autocmds
;;;

(let [group (augroup :NuvimAutocmds {:clear true})]
  (autocmd :FileType
           {: group
            :pattern [:help :qf :man]
            :desc "quit help pages with 'q'"
            :callback #(map! [n &buffer &desc "close help"] :q (cmd "close"))})
  (autocmd :TextYankPost
           {: group :callback #(vim.hl.on_yank {:higroup :Visual})}))
