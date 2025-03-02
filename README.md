# toggler-nvim
Toggle UI elements effortlessly.

## Usage

```lua
local M = require('toggler')

-- register ui element
M.register('qf', {
  open = function() vim.cmd('copen') end,
  close = function() vim.cmd('cclose') end,
  is_open = function()
    return vim.fn.getqflist({winid = 0}).winid ~= 0
  end
})

-- toggle ui element
M.toggle('qf')
```
