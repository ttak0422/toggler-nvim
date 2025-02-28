# toggler-nvim
Toggle UI elements effortlessly.

## Usage

```fennel
(local M (require :toggler))

; register ui element
(M.register :qf {:open (fn [] (vim.cmd :copen))
                 :close (fn [] (vim.cmd :cclose))
                 :is_open (fn []
                            (not= (-> (vim.fn.getqflist {:winid 0})
                                      (. :winid))
                                  0))})

; toggle ui element
; (M.toggle :qf)
```
