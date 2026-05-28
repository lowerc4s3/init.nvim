(import-macros {: cmd : map} :lib.macros)

(let [g vim.g]
  (set g.mapleader " ")
  (set g.maplocalleader ","))

(map :nv :<Space> :<Nop>)
(map :n :<Esc> (cmd :nohlsearch) {:desc "disable search hl"})

;; helix like $ and ^ shortcuts
(map :n :gl "$" {:desc "to the end of the line"})
(map :n :gh "^" {:desc "to the first non-blank character of the line"})

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
