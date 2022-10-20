local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end

---@diagnostic disable-next-line: lowercase-global
owo = {}

MODULES = {
  "util.std",
  "core.packages",
  "core.options",

  "setup._pre",
  "setup.which-key",
  "setup.mason",
  "setup.neo-tree",
  "setup.treesitter",
  "setup.luadev",
  "setup.simple",
  "setup.alpha",
  --"setup.iron",

  "util.edit-config",
  "util.buf",
  --"util.java-brazil",

  "core.bindings",
  "setup.better_escape",
  "setup.cmp",

  "lang._pre",
  "lang.lua",
  --"lang.barium",
  --"lang.jdtls-brazil",
  "lang.simple",

  "core.theme",
}

for _, source in ipairs(MODULES) do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end
