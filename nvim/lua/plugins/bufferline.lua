return {
  'akinsho/bufferline.nvim',
  version = "*",
  after = "catppuccin",
  dependencies = 'nvim-tree/nvim-web-devicons',

  config = function ()
    local bufferline = require('bufferline')

    bufferline.setup({
      options = {
        mode = "tabs",
        themeable = true,
        show_close_icon = false,
        show_buffer_close_icons = false,
        seperator_style = "thin",

        custom_areas = {},
      },

      highlights = require("catppuccin.groups.integrations.bufferline").get {
        styles = { "bold" },
        custom = { }
      },

    })
  end
}


