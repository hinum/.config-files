return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = { view = "cmdline" }
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      'hrsh7th/nvim-cmp',
      dependencies = {
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
      },

      config = function ()
        local cmp = require("cmp")
        local mapping = {
          ['right'] = cmp.mapping.select_next_item(),
          ['left'] = cmp.mapping.select_prev_item(),
          ['<c-t>'] = cmp.mapping.confirm()
        }

        cmp.setup()
        cmp.setup.cmdline({ '/', '?' }, {
          mapping = mapping,
          sources = {
            { name = 'buffer' }
          }
        })
        cmp.setup.cmdline(':', {
          mapping = mapping,
          sources = cmp.config.sources(
            {{ name = 'path' }}, 
            {{ name = 'cmdline' }}
          ),
          matching = { disallow_symbol_nonprefix_matching = false }
        })
      end
    }, {
      "rcarriga/nvim-notify",
      opts = {
        render = "wrapped-compact",
        max_width = 40,
        timeout = 900,
        top_down = false
      }
    }
  }
}
