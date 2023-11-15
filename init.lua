---@diagnostic disable-next-line: lowercase-global
owo = {}

require("install-paq")

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
  "setup.dracula",
  "setup.simple",
  "setup.alpha",
  "setup.notify",
  "setup.bufferline",
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
  "lang.clangd",
  "lang.solargraph",
  "lang.barium",
  "lang.jdtls-brazil",
  "lang.simple",

  "core.theme",
}

for _, source in ipairs(MODULES) do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.notify("Failed to load " .. source .. "\n\n" .. fault) end
end
