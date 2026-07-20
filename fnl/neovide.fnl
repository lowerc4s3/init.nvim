(local {: map} (require :lib.map))

(macro setnv [name val]
  "set neovide option (desugars into vim.g.neovide_%name = val)"
  `(tset vim.g ,(.. :neovide_ (tostring name)) ,val))

(set vim.o.linespace 7)

(let [pad 10]
  (setnv padding_top pad)
  (setnv padding_bottom pad)
  (setnv padding_right pad)
  (setnv padding_left pad))

(setnv scroll_animation_length 0.1)
(setnv scroll_animation_far_lines 3)

(setnv cursor_animation_length 0.15)
(setnv cursor_short_animation_length 0.04)
(setnv cursor_trail_size 1.0)
(setnv cursor_smooth_blink true)

(setnv floating_shadow false)

;; interpret right option as meta on macos (left one is used as yabai super key)
(setnv input_macos_option_key_is_meta :only_right)

(let [prefix (if (vim.fn.has :macunix) "<D-" "<C-S-")
      mod #(.. prefix $ ">")]
  (map [:n :v :l :t] (mod "n")
       #(vim.uv.spawn "neovide" {:detached true} (fn []))
       {:desc "spawn new instance"})
  (map [:n :v :l :t :i] (mod "v")
       #(vim.api.nvim_paste (vim.fn.getreg :+) true -1)
       {:desc "paste from system clipboard"}))
