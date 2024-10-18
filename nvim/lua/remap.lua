
-- map commands
vim.keymap.set("n", "<leader>pv", vim.cmd.Neotree)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>z", vim.cmd.q)
vim.keymap.set("n", "<leader>q", vim.cmd.nohlsearch)
vim.keymap.set("n", "<leader>ms", "<C-W>T", { desc = "M/ove S/plitscreen" })

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

-- remap difficult to use (on a phone) keys
vim.keymap.set("n", "e", "<c-right>")
vim.keymap.set("n", "b", "<c-left>")

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
vim.keymap.set({"v", "n"}, "<leader>cy", '"+y')
vim.keymap.set("n", "<leader>cp", '"+p')

-- visual mode
vim.keymap.set("v", "e", "<c-u>", { desc = "[v] up half a page" })
vim.keymap.set("v", "n", "<c-d>", { desc = "[v] down half a page" })

-- plugins
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

vim.keymap.set("n", "<leader>d", function () vim.cmd.Noice("dismiss") end)
vim.keymap.set("n", "<leader>nf", function () vim.cmd.Telescope("notify") end)
vim.keymap.set("n", "<leader>di", function () vim.cmd.CocCommand("deno.initializeWorkspace") end)

