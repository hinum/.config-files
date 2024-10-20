return {
  'hrsh7th/nvim-cmp',

  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    'saadparwaiz1/cmp_luasnip',
    { 'L3MON4D3/LuaSnip', build = "make install_jsregexp" }
  },

  config = function ()
    local cmp = require("cmp")
    local cmdlineMapping = {
      ['<c-w>'] = cmp.mapping.select_next_item(),
      ['<c-b>'] = cmp.mapping.select_prev_item(),
      ['<c-t>'] = cmp.mapping.confirm()
    }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-e>'] = cmp.mapping.scroll_docs(-4),
        ['<C-n>'] = cmp.mapping.scroll_docs(4),
        ['<C-d>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),

      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip'  }
      },
        {{ name = 'buffer' }}
      )
    })

    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmdlineMapping,
      sources = {{ name = 'buffer' }}
    })
    cmp.setup.cmdline(':', {
      mapping = cmdlineMapping,
      sources = cmp.config.sources(
        {{ name = 'path' }}, 
        {{ name = 'cmdline' }}
      ),
      matching = { disallow_symbol_nonprefix_matching = false }
    })

    local lspconf = require("lspconfig")
    lspconf.util.default_config.capabilities = require('cmp_nvim_lsp').default_capabilities()

    vim.g.markdown_fenced_languages = { "ts=typescript" }
    lspconf.denols.setup{}
    lspconf.ts_ls.setup{
      root_dir = lspconf.util.root_pattern("package.json"),
      single_file_support = false
    }

  end
}
