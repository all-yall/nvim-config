local cmp = require('cmp')
local cmp_types = require('cmp.types')
owo.cmp = cmp

if cmp then
  cmp.setup {
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    window = {
      --completion = cmp.config.window.bordered(),
      --documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp',
        max_item_count=12,
        entry_filter = function(entry, _)
          return cmp_types.lsp.CompletionItemKind[entry:get_kind()] ~= 'Text'
        end,
      },
      --{ name = 'luasnip', max_item_count=12 }, -- For luasnip users.
    }, {}), --{{ name = 'buffer' }}),
  }

  -- `/` cmdline setup.
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer', max_item_count=12}
    }
  })

  -- `:` cmdline setup.
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
        { name = 'cmdline', max_item_count=12}
      })
  })
end

cmp.capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
