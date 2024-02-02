local std = owo.std

local config = {}
owo.config = config


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
  reload_module("lazy", false)

  vim.cmd.LspRestart()
  local reloaded, _ = pcall(dofile, std.get_config_file())
  if reloaded and not quiet then std.notify "Reloaded config" end
end

function config.stop_edit()
  if not OLD_DIR then
    std.notify("Not editing config; Doing nothing.")
    return
  end
  std.notify("Switching back directory '"..OLD_DIR.."'")
  vim.api.nvim_set_current_dir(OLD_DIR)
end

function config.edit()
  if std.pwd() == config.root then
    std.notify("Sourcing config")
    config.reload(true)
    vim.cmd("e!")
  else
    std.notify("Switching to config directory")
    OLD_DIR = std.pwd()
    vim.api.nvim_set_current_dir(std.get_config_folder())
    vim.cmd("e " .. std.get_config_file())
  end
end
