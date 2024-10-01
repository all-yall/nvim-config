
require("better_escape").setup {
  timeout = vim.o.timeoutlen,
  default_mappings = true,
  mappings = {
    i = {
      j = {
        -- These can all also be functions
        k = "<Esc>",
      },
    },
    c = {
      j = {
        k = "<Esc>",
      },
    },
    t = {
      j = {
        k = "<C-\\><C-n>",
      },
    },
    v = {
      j = {
        k = false --disable this shortcut
      }
    },
    s = {
      j = {
        k = "<Esc>",
      },
    },
  },
}

