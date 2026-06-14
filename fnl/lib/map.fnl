(import-macros {: => : |} :lib.macro)
(local {: keymap} vim)

(local map keymap.set)
(local unmap keymap.del)

(fn maplead [lhs rhs opts]
  "define a normal mode mapping starting with <Leader>"
  (map :n (.. "<Leader>" lhs) rhs opts))

(fn maploclead [lhs rhs opts]
  "define a normal mode mapping starting with <LocalLeader>"
  (map :n (.. "<LocalLeader>" lhs) rhs opts))

(when (not _G.nuvim/mapgroups)
  (set _G.nuvim/mapgroups []))
  
(fn defgroup [lhs desc]
  "define a which-key group"
  (let [group (| lhs {:group desc})]
    (case _G.package.loaded.which-key
      nil (table.insert _G.nuvim/mapgroups group)
      wk (wk.add [group]))))

(fn loadgroups []
  "loads all groups defined before which-key setup"
  (let [wk (require :which-key)]
    (each [_ group (ipairs _G.nuvim/mapgroups)]
      (wk.add [group]))
    (set _G.nuvim/mapgroups [])))

{: map
 : unmap
 : maplead
 : maploclead
 : defgroup
 : loadgroups}
