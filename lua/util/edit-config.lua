local std = owo.std

local config = {}
owo.config = config

config.init_file = std.get_env("MYVIMRC")
config.root = vim.fs.dirname(config.init_file)

local old_dir = std.pwd()

--- Reload the configuration live 
function config.reload(quiet)
  local reload_module = require("plenary.reload").reload_module
  require("neo-tree").close_all()
  vim.api.nvim_del_augroup_by_name("lspconfig") -- lspconfig sets clear = false in augroup options

  -- unload modules
  reload_module("core", false)
  reload_module("lang", false)
  reload_module("setup", false)
  reload_module("util", false)
  -- manual unload some plugins that need it if they exist
  reload_module("lsp", false)
  reload_module("cmp", false)
  reload_module("which-key", false)
  reload_module("neo-tree", false)

  vim.cmd.LspRestart()
  local reloaded, _ = pcall(dofile, config.init_file)
  if reloaded and not quiet then std.notify "Reloaded config" end
end

function config.stop_edit()
  std.notify("Switching back directory '"..old_dir.."'")
  vim.api.set_current_dir(old_dir)
end

function config.edit()
  if std.pwd() == config.root then
    std.notify("Sourcing config")
    config.reload(true)
  else
    std.notify("Switching to config directory")
    old_dir = std.pwd()
    vim.cmd("cd " .. config.root)
    vim.cmd("e " .. config.init_file)
  end
end
