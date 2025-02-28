-- [nfnl] Compiled from fnl/toggler/init.fnl by https://github.com/Olical/nfnl, do not edit.
local S = {}
local function register(id, opts)
  if ((_G.type(opts) == "table") and (nil ~= opts.open) and (nil ~= opts.close) and (nil ~= opts.is_open)) then
    local open = opts.open
    local close = opts.close
    local is_open = opts.is_open
    S[id] = {open = open, close = close, is_open = is_open}
    return nil
  else
    local _ = opts
    return error("invalid opts")
  end
end
local function toggle(id)
  local _2_ = S[id]
  if (nil ~= _2_) then
    local s = _2_
    if s.is_open() then
      return s.close()
    else
      for _, _3_ in pairs(S) do
        local close = _3_["close"]
        close()
      end
      return s.open()
    end
  else
    local _ = _2_
    return error("invalid id")
  end
end
return {register = register, toggle = toggle}
