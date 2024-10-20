
function record ()
  local recordReg = vim.fn.reg_recording()
  if recordReg == "" then return "" end
  return "󰑊 " .. recordReg
end

function lspName ()
  local bufnr = vim.api.nvim_get_current_buf()
  local lspServer = vim.lsp.get_clients{ bufnr = bufnr }[1]

  if lspServer == nil then return ""
  else return lspServer.name end
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      component_separators = { left = ' ', right = ' '},
      section_separators = { left = ' ', right = ' '},
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = false,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch'},
      lualine_c = {'filename'},
      lualine_x = {'diagnostics', {lspName}},
      lualine_y = {'diff', {record, color = { fg = "#e78284" }}},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
}
