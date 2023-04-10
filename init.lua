local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end

---@diagnostic disable-next-line: lowercase-global
owo = {}

GLOBAL_VAL="Hello world!";

local MODULES = {
  "util.debug",
  "util.std",
  "util.lay",
  "core.packages",
  "core.options",

  "setup._pre",
  "setup.which-key",
  "setup.mason",
  "setup.neo-tree",
  "setup.treesitter",
  "setup.ts-context",
  "setup.catppuccin",
  "setup.simple",
  "setup.luadev",
  "setup.alpha",
  "setup.notify",
  "setup.iron",

  "util.edit-config",
  "util.buf",
  --"util.java-brazil",

  "core.bindings",
  "core.modes",
  "setup.better_escape",
  "setup.cmp",

  "lang._pre",
  "lang.lua",
  "lang.clangd",
  --"lang.barium",
  --"lang.jdtls-brazil",
  "lang.simple",

  "core.theme",
}

for _, source in ipairs(MODULES) do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end
