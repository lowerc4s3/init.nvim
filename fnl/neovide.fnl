(local {: map} (require :lib.nvim))

(macro nv [name val]
  "set neovide option (desugars into vim.g.neovide_%name = val)"
  `(tset vim.g ,(.. :neovide_ (tostring name)) ,val))

(set vim.o.linespace 11)

(let [pad 10]
  (nv padding_top pad)
  (nv padding_bottom pad)
  (nv padding_right pad)
  (nv padding_left pad))

(nv scroll_animation_length 0.1)
(nv scroll_animation_far_lines 3)

(nv cursor_animation_length 0.15)
(nv cursor_short_animation_length 0.04)
(nv cursor_trail_size 1.0)
(nv cursor_smooth_blink true)

(nv floating_shadow false)

;; interpret left option as meta on macos (right one is used as yabai super key)
(nv input_macos_option_key_is_meta :only_right)

(let [prefix (if (vim.fn.has :macunix) "<D-" "<C-S-")
      mod #(.. prefix $ ">")]
  (map [:n :v :l :t]
       (mod "n")
       #(vim.uv.spawn "neovide" {:detached true} (fn []))
       {:desc "spawn new instance"})

  (map [:n :v :l :t :i]
       (mod "v")
       #(vim.api.nvim_paste (vim.fn.getreg :+) true -1)
       {:desc "paste from system clipboard"}))
