
local alpha = require'alpha'
local theme =  require'alpha.themes.dashboard'
theme.section.header.val = {
 [[   _   _  _____ _____  _   _ _             ]],
 [[  | \ | ||  ___|  _  || | | (_)            ]],
 [[  |  \| || |__ | | | || | | |_ _ __ ___    ]],
 [[  | . ` ||  __|| | | || | | | | '_ ` _ \   ]],
 [[  | |\  || |___\ \_/ /\ \_/ / | | | | | |  ]],
 [[  \_| \_/\____/ \___/  \___/|_|_| |_| |_|  ]],
 }

theme.section.buttons.val = {
  theme.button("e", "Edit New File", "<cmd>enew<cr>"),
  theme.button("t", "File Tree", "<cmd>Neotree toggle<cr>"),
  theme.button("f", "Find File", "<cmd>Telescope find_files<cr>"),
  theme.button("g", "Grep Files", "<cmd>Telescope live_grep<cr>"),
  theme.button("q", "Close This Window", "<cmd>q<cr>"),
}
theme.section.footer.val = "Ally's New Vi Improved!"
alpha.setup(theme.config)


local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

-- Disable the statusline, tabline and cmdline while the alpha dashboard is open
autocmd('User', {
  pattern = 'AlphaReady',
  desc = 'disable status, tabline and cmdline for alpha',
  callback = function(file)
    local pre_laststatus = vim.go.laststatus
    local pre_showtabline = vim.opt.showtabline
    local pre_cmdheight = vim.opt.cmdheight

	  vim.go.laststatus = 0
    vim.opt.showtabline = 0
	  vim.opt.cmdheight = 0

    -- set 'per buffer unload' autocmd to reenable stuff
    autocmd({'BufUnload'}, {
      once = true,
      buffer = file.buf,
      desc = 'enable status, tabline and cmdline after alpha',
      callback = function()
        vim.go.laststatus = pre_laststatus
        vim.opt.showtabline = pre_showtabline
        vim.opt.cmdheight = pre_cmdheight
      end,
    })
  end,
})

