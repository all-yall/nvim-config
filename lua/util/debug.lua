local debug = {}
owo.debug = debug

-- this is usefull to debug reloading config functionality, as it allows finding
-- the 'leaked' auto commands
function debug.intercept_au_and_groups()
  -- intercept auto commands and print those not attached to a group
  local orig_augroup = vim.api.nvim_create_augroup
  vim.api.nvim_create_augroup = function(name, opts)
    if not opts.clear then
      print("(intercept command)=> ", name, vim.inspect(opts))
    end
    orig_augroup(name, opts)
  end

  -- intercept auto command groups and print those that put clear to false
  local orig_aucommand = vim.api.nvim_create_autocmd
  vim.api.nvim_create_autocmd = function(event, opts)
    if opts.group == false then
      print("(intercept group)=> ",vim.inspect(event), vim.inspect(opts))
    end
    orig_aucommand(event, opts)
  end
end
