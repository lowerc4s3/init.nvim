(local {: hi} (require :lib.nvim))

(macro cmp->blink [hls]
  (icollect [_ kind (ipairs hls)]
    `(hi ,(.. :BlinkCmpKind kind) {:link ,(.. :CmpItemKind kind)})))

(cmp->blink [:Snippet
             :Text
             :Function
             :Value
             :Variable
             :Keyword
             :Method
             :Constructor
             :Folder
             :File
             :Module
             :Constant
             :Field
             :Property
             :Enum
             :EnumMember
             :Unit
             :Class
             :Struct
             :Interface
             :Variable
             :Color
             :Reference
             :Event
             :Operator
             :TypeParameter])
