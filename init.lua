---@diagnostic disable-next-line: lowercase-global
owo = {}

require("install-lazy")

local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end

local MODULES = {
  "util.debug",
  "util.std",
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
  "setup.alpha",
  "setup.notify",
  "setup.bufferline",
  "setup.symbols_outline",
  "setup.dap",

  "util.edit-config",
  "util.buf",
  "util.java-brazil",

  "setup.better_escape",
  "setup.cmp",

  "core.bindings",
  "core.modes",

  "lang._pre",
  "lang.lua",
  "lang.solargraph",
  "lang.jdtls-brazil",
  "lang.simple",

  "core.theme",
}

for _, source in ipairs(MODULES) do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.notify("Failed to load " .. source .. "\n\n" .. fault) end
end
