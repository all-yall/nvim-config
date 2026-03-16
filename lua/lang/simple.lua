-- adding a new language
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

local lsp_langs = {
  "vimls",
  "pyright",
  "texlab",
  "racket_langserver",
  "gopls",
  "golangci_lint_ls",
  "hls",
  "clangd",
  "ts_ls",
  "glsl_analyzer",
};

for _, lang in ipairs(lsp_langs) do
  vim.lsp.config[lang] = {
    capabilities = owo.cmp.capabilities,
    single_file_support = true,
  }
end

vim.lsp.config.rust_analyzer = {
  capabilities = owo.cmp.capabilities,
  single_file_support = true,
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = false;
      }
    }
  }
}
