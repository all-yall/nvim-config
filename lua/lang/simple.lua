-- adding a new language
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

local lsp_langs = {
  "vimls",
  "tsserver",
  "rust_analyzer",
  "tailwindcss",
  "texlab",
  "racket_langserver",
  "solargraph",
};

for _, lang in ipairs(lsp_langs) do
  owo.lsp.lspconfig[lang].setup {
    capabilities = owo.cmp.capabilities,
  }
end
