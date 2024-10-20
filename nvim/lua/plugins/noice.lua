return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    cmdline = { view = "cmdline" }
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
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
