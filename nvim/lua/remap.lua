
-- map commands
vim.keymap.set("n", "<leader>pv", vim.cmd.Neotree)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>z", vim.cmd.q)
vim.keymap.set("n", "<leader>q", vim.cmd.nohlsearch)
vim.keymap.set("n", "<leader>ms", "<C-W>T") -- M/ove S/plitscreen

function tabnew(fn)
  return function ()
    vim.cmd.tabnew()
    fn()
  end
end

-- tab stuff
vim.keymap.set("n", "<leader>ti", tabnew(vim.cmd.terminal))
vim.keymap.set("n", "<leader>tpv", tabnew(vim.cmd.Neotree))

vim.keymap.set("n", "<leader>a", vim.cmd.tabnext)
vim.keymap.set("n", "<leader>tu", vim.cmd.tabclose)
vim.keymap.set("n", "<leader>to", vim.cmd.tabonly)
vim.keymap.set("n", "<leader>tnc", "<cmd>.+1,$tabdo :tabc<cr>") -- close every tab to the right

-- remap difficult to use (on a phone) keys
vim.keymap.set("n", "w", "<c-right>")
vim.keymap.set("n", "b", "<c-left>")
vim.keymap.set("n", "e", "w")

vim.keymap.set({"n", "v"}, "h", "F")
vim.keymap.set({"n", "v"}, "j", "T")
vim.keymap.set({"n", "v"}, "<home>", "_")
vim.keymap.set({"n", "v"}, "m", "N")

-- shadow realms operations
vim.keymap.set({"n", "v"}, "<leader>d", '"_d')
vim.keymap.set({"n", "v"}, "<leader>p", '"_p')
vim.keymap.set({"n", "v"}, "<leader>c", '"_c')
vim.keymap.set("n", "r", '"_r')

-- system clipboard
-- vim.keymap.set({"v", "n"}, "<leader>cy", '"+y') doesnt work
vim.keymap.set({"v", "n"}, "<leader>cp", '"+p')

-- visual mode
vim.keymap.set("v", "e", "<c-u>") -- up half a page
vim.keymap.set("v", "n", "<c-d>") -- down half a page

-- plugins
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files )
vim.keymap.set('n', '<leader>fg', builtin.live_grep )
vim.keymap.set('n', '<leader>fb', builtin.buffers )
vim.keymap.set('n', '<leader>fh', builtin.help_tags )

vim.keymap.set("n", "<leader>unf", function () vim.cmd.Telescope("notify") end)

local gitignore = require("gitignore")
vim.keymap.set("n", "<leader>uig", gitignore.generate)

-- lsp keybinds
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>uca', vim.lsp.buf.code_action, opts)
    
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
  end,
})

-- format on save
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function ()
    if (vim.lsp.buf_is_attached(0)) then
      vim.lsp.buf.format()
    end
  end
})



