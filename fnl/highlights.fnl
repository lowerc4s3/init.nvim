(local {: hi} (require :lib.nvim))

(when (= :oxocarbon vim.g.colors_name)
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
  (hi :FloatTitle {:link :NormalFloat})
  (hi :FoldColumn {:link :LineNr})
  (let [gray50 "#8d8d8d"
        oxo (. (require :oxocarbon) :oxocarbon)]
    (hi "@punctuation.delimiter" {:fg gray50})
    (hi "@punctuation.bracket" {:fg gray50})
    (hi :NonText {:fg gray50 :bg oxo.none}) ; snacks.picker uses this a lot
    (hi :Delimiter {:link "@punctuation.delimiter"})

    (hi :SnacksPickerPrompt {:fg oxo.base03 :bg oxo.blend})
    (hi :SnacksPickerInputCursorLine {:link :NormalFloat})
    (hi :SnacksPickerListCursorLine {:link :CursorLine})
    (hi :SnacksPickerMatch {:fg oxo.base11})
    (hi :SnacksPickerPreviewTitle {:link :TelescopePreviewTitle})))
