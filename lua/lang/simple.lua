-- adding a new language
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local lsp_langs = {
  "vimls",
  "pyright",
  "rust_analyzer",
  "texlab",
  "racket_langserver",
  "gopls",
  "golangci_lint_ls",
  "hls",
  "clangd",
};

for _, lang in ipairs(lsp_langs) do
  owo.lsp.lspconfig[lang].setup {
    capabilities = owo.cmp.capabilities,
    single_file_support = true,
  }
end

