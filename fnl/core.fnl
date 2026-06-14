(import-macros {: set+ : set^ : =>} :lib.macro)
(local {: autocmd : augroup} (require :lib.nvim))
(local {: map : maplead : defgroup} (require :lib.map))
(local {: g : o : wo : opt : pack} vim)

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
(set o.updatetime 500) ; fire CursorHold event every 0.5 secs

;;; file handling
(set o.swapfile false) ; no .swp files
(set o.undofile true) ; persistent undo
(set^ opt.sessionoptions :globals)

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
(set^ opt.guicursor "a:Cursor") ; force cursor hl in all modes
(=> (require :vim._core.ui2) (enable {:msg {:targets :msg}}))

;;; modeline
(set o.cmdheight 0)
(set o.ruler false) ; hide cursor position
(set o.showmode false) ; hide current mode indicator (--INSERT--)
(set o.showcmd false) ; hide visual mode selection
(set o.laststatus 2) ; 2 - statusline in each window, 3 - global statusline
(set o.signcolumn :yes) ; always show signcolumn
(set+ opt.shortmess {:S true}) ; do not show search count message

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
(set g.maplocalleader "\\")

(map [:n :v :o] "<Space>" "<Nop>")
(map :n "<Esc>" "<cmd>nohlsearch<cr>" {:desc "disable search hl"})

;; helix like $ and ^ shortcuts
(map [:n :v :o] "gl" "$" {:desc "to the end of the line"})
(map [:n :v :o] "gh" "^" {:desc "to the first non-blank character of the line"})

;; don't leave visual mode when indenting
(map :v "<" "<gv")
(map :v ">" ">gv")

;; window traversal shortcuts
(map :n "<C-h>" "<C-w>h" {:desc "move to the left window"})
(map :n "<C-j>" "<C-w>j" {:desc "move to the lower window"})
(map :n "<C-k>" "<C-w>k" {:desc "move to the upper window"})
(map :n "<C-l>" "<C-w>l" {:desc "move to the right window"})

(map :i "<C-h>" "<Left>" {:desc "move left"})
(map :i "<C-j>" "<Down>" {:desc "move down"})
(map :i "<C-k>" "<Up>" {:desc "move up"})
(map :i "<C-l>" "<Right>" {:desc "move right"})

(defgroup "<Leader>c" "code")
(maplead "cd" vim.diagnostic.setloclist {:desc "code diagnostics"})
(maplead "cD" vim.diagnostic.setqflist {:desc "code diagnostics (workspace)"})

(defgroup "<Leader>p" "packages")
(maplead "pl" #(pack.update nil {:offline true}) {:desc "list packages"})
(maplead "pf" #(pack.update nil) {:desc "fetch updates"})
(maplead "px" #(vim.cmd.packdel {:bang true}) {:desc "clean unused plugins"})

;;;
;;; autocmds
;;;

(let [group (augroup :CoreAutocmd)]
  (autocmd :FileType
           {: group
            :pattern [:help :qf :man]
            :callback #(map :n "q" "<cmd>close<cr>" {:desc "Close help" :buf 0})
            :desc "quit help pages with 'q'"})
  (autocmd :WinEnter {: group :callback #(set wo.cursorline true)})
  (autocmd :WinLeave {: group :callback #(set wo.cursorline false)})
  (let [has-hl_op (vim.fn.has :nvim-0.13)
        hl-op (if has-hl_op vim.hl.hl_op vim.hl.on_yank)]
    (autocmd :TextYankPost
             {: group
              :callback #(hl-op {:higroup :Visual})
              :desc "highlight yanked area"})
    (when has-hl_op
      (autocmd :TextPutPost
               {: group
                :callback #(hl-op {:higroup :Visual})
                :desc "highlight put area"}))))
