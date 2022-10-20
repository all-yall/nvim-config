owo.amazon = {}

owo.amazon.run_checkstyle = function()
  vim.api.nvim_command('cclose')
  vim.opt.makeprg = "broken-fast-brazil-build"
  vim.opt.errorformat = '[checkstyle] %f:%l:%c:%m,[checkstyle] %f:%l:%m'
  vim.opt.shellpipe = '2>&1 | tee /tmp/checkstyle-errors.txt | grep "^.checkstyle. " > %s'
  vim.api.nvim_command('make fastcheckstyle')
  vim.api.nvim_command('copen')
end

local execute_test = function(test_strategy, additional_args)
  vim.g["test#project_root"] = vim.fn.fnamemodify(vim.fn.finddir(".git", ".;"), ":p:h:h")
  vim.api.nvim_exec(string.format("%s %s", test_strategy, additional_args or ""), false)
end

vim.g.test_debug_flags = "-Dtests.additional.jvmargs='-Xdebug -Xnoagent'"
vim.g.test_extra_flags = ""

vim.g['test#custom_runners'] = { java = {'braziltest'} }
vim.g['test#java#runner'] = 'braziltest'
vim.g["test#strategy"] = "neovim"

owo.amazon.test_nearest = function() execute_test("TestNearest", vim.g.test_extra_flags .. " " .. vim.g.test_debug_flags) end
owo.amazon.test_suite =   function() execute_test("TestSuite",   vim.g.test_extra_flags .. " " .. vim.g.test_debug_flags) end

owo.amazon.select_test_strategy =  function()
  local unroll = function (source)
    return vim.tbl_flatten(
    vim.tbl_map(
    function (lang)
      return lang
    end,
    source))
  end
  local test_strategies = vim.tbl_deep_extend(
  "force",
  unroll(vim.g["test#enabled_runners"] or {}),
  unroll(vim.g["test#custom_runners"] or {})
  )
  vim.ui.select(test_strategies, { prompt = "Select current test strategy:" }, function(choice)
    local file_type = vim.bo.filetype
    if choice == nil or file_type == nil then
      return
    end

    vim.g["test#" .. file_type .. "#runner"] = choice
  end)
end
