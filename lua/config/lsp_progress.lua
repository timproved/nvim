local M = {}
local _state = {} -- keyed by client_id
local LINGER_MS = 1500
local _float = { buf = nil, win = nil }

local function get_text()
  local now = vim.uv.now()
  local parts = {}
  local expired = {}
  for client_id, p in pairs(_state) do
    if p.done_at then
      if now - p.done_at < LINGER_MS then
        table.insert(parts, p.title)
      else
        table.insert(expired, client_id)
      end
    else
      local text = p.title
      if p.message ~= "" then
        text = text .. ": " .. p.message
      end
      if p.percentage then
        text = text .. " (" .. p.percentage .. "%%)"
      end
      table.insert(parts, text)
    end
  end
  for _, id in ipairs(expired) do
    _state[id] = nil
  end
  return #parts > 0 and table.concat(parts, " | ") or ""
end

local function close()
  if _float.win and vim.api.nvim_win_is_valid(_float.win) then
    vim.api.nvim_win_close(_float.win, true)
  end
  _float.win = nil
end

local function render()
  local text = get_text()
  if text == "" then
    close()
    return
  end

  local content = " " .. text .. " "
  local width = vim.fn.strdisplaywidth(content)
  local row = vim.o.lines - vim.o.cmdheight - 2
  local col = vim.o.columns - width - 1

  if not (_float.buf and vim.api.nvim_buf_is_valid(_float.buf)) then
    _float.buf = vim.api.nvim_create_buf(false, true)
    vim.bo[_float.buf].bufhidden = "wipe"
  end

  vim.api.nvim_buf_set_lines(_float.buf, 0, -1, false, { content })

  if _float.win and vim.api.nvim_win_is_valid(_float.win) then
    vim.api.nvim_win_set_config(_float.win, {
      relative = "editor",
      row = row,
      col = col,
      width = width,
      height = 1,
    })
  else
    _float.win = vim.api.nvim_open_win(_float.buf, false, {
      relative = "editor",
      row = row,
      col = col,
      width = width,
      height = 1,
      style = "minimal",
      focusable = false,
      noautocmd = true,
    })
    vim.wo[_float.win].winhighlight = "Normal:Comment"
  end
end

function M.update(client_id, value)
  if value.kind == "end" then
    _state[client_id] = {
      title = value.title or "done",
      message = "",
      done_at = vim.uv.now(),
    }
    render()
    vim.defer_fn(render, LINGER_MS)
  else
    _state[client_id] = {
      title = value.title or "",
      message = value.message or "",
      percentage = value.percentage,
    }
    render()
  end
end

return M
