(fn autoload [mod-name]
  "lazily require module. behaves like `require`
but loads module on the first access."
  (local wrapper {:mod nil})

  (fn wrapper.ensure [self]
    (when (not self.mod)
      (set self.mod (require mod-name)))
    self.mod)

  (setmetatable wrapper
                {:__call (fn [self ...] ((self:ensure) ...))
                 :__index (fn [self k] (. (self:ensure) k))
                 :__newindex (fn [self k v] (tset (self:ensure) k v))}))
  
{: autoload}
