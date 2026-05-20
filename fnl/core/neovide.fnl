(import-macros {: map} :macros)

(macro nv [name val]
  "set neovide option (desugars into vim.g.neovide_%name = val)"
  `(tset vim.g ,(.. :neovide_ (tostring name)) ,val))

(set vim.opt.linespace 13)

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

(fn mod [key]
  "make a mod keymap string <mod-%key>.
  mod is system-dependant and defined as cmd in macos (<D>)
  and ctrl-shift elsewhere (<C-S>)"
  (let [prefix (if (vim.fn.has :macunix) :<D- :<C-S-)]
    (.. prefix key ">")))

(map :n (mod :n)
     (fn []
       (vim.uv.spawn :neovide {:detached true} (fn [])))
     {:desc "spawn new instance"})

(map :nvsxoilct (mod :v)
     (fn [] (vim.api.nvim_paste (vim.fn.getreg "+") true -1))
     {:desc "paste from system clipboard"})
