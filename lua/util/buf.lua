local std = owo.std

local buf = {}
owo.buf = buf

local exclude = {
  ["neo-tree"] = true,
  ["aerial"] = true,
  ["fugitive"] = true,
  ["fugitiveblame"] = true,
  ["git"] = true,
  ["help"] = true,
}

local function check_ok()
  local name = vim.bo.filetype
  if exclude[name] then
    std.notify("Won't modify buffer in ".. name .." window.")
    return false
  end
  return true
end

function buf.next()
  if check_ok() then
    vim.cmd("bnext")
  end
end

function buf.prev()
  if check_ok() then
    vim.cmd("bprev")
  end
end

function buf.close()
  if check_ok() then
    vim.cmd("bp|sp|bn|bd") -- TODO bad binding
  end
end

function buf.alt()
  if check_ok() then
    vim.api.nvim_feedkeys("", 'n', false)
  end
end
