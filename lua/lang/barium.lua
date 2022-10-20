if not owo.lsp.configs.barium then
  owo.lsp.configs.barium = {
    default_config = {
      cmd = {'barium'};
      filetypes = {'brazil-config'};
      root_dir = function(fname)
        return owo.lsp.lspconfig.util.find_git_ancestor(fname)
      end;
      settings = {};
    };
  }
end

owo.lsp.lspconfig.barium.setup {
  capabilities = owo.cmp.capabilities,
}
