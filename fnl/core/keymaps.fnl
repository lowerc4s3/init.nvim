;; TODO: move macros to a separate module
(macro cmd [str] (.. ":" str :<CR>))

(macro map [modes lhs rhs opts]
  (when (= opts.silent nil) (set opts.silent true))
  (let [modelist (icollect [mode (string.gmatch modes ".")] mode)]
    `(vim.keymap.set ,modelist ,lhs ,rhs ,opts)))

(let [g vim.g]
  (set g.mapleader " ")
  (set g.maplocalleader ","))

(map :nv :<Space> :<Nop> {:desc "disable leader key mapping"})
(map :n :<Esc> (cmd :nohlsearch) {:desc "disable search hl"})

(map :n :<C-h> :<C-w>h {:desc "move to the left window"})
(map :n :<C-j> :<C-w>j {:desc "move to the lower window"})
(map :n :<C-k> :<C-w>k {:desc "move to the upper window"})
(map :n :<C-l> :<C-w>l {:desc "move to the right window"})

(map :i :<C-h> :<Left> {:desc "move left"})
(map :i :<C-j> :<Down> {:desc "move down"})
(map :i :<C-k> :<Up> {:desc "move up"})
(map :i :<C-l> :<Right> {:desc "move right"})
