-- set tab size to 2

vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.expandtab = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.scrolloff = 9999
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.g.mapleader = " "

vim.g.clipboard = {
  name = "termux",
  paste = {
    ["*"] = "termux-clipboard-get",
    ["+"] = "termux-clipboard-get"
  },
  copy = {
    ["*"] = "",
    ["+"] = ""
  }
}
