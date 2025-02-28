;; { [string] : { open: fun(), close: fun(), is_open: fun() } }
(local S {})

(fn register [id opts]
  "
  register target.

  type:
    id: string -> opts: { open: fun(), close: fun(), is_open: fun(): boolean } -> ()

  note:
    close must be defined carefully as it will be executed regardless of the open call.
  "
  (case opts
    {: open : close : is_open} (tset S id {: open : close : is_open})
    _ (error "invalid opts")))

(fn toggle [id]
  "
  toggle target.

  type:
    id: string -> ()
  "
  (case (. S id)
    s (if (s.is_open)
          (s.close)
          (do
            (each [_ {: close} (pairs S)]
              (close))
            (s.open)))
    _ (error "invalid id")))

{: register : toggle}
