(import-macros {: cmd : map} :macros)

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
