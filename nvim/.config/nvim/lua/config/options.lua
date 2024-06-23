-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- LazyVim auto format
vim.g.autoformat = false

-- Give indication of column limit
vim.opt.colorcolumn = "111"

vim.opt.scrolloff = 10 -- Lines of context

-- LSP Server to use for Python.
-- Set to "basedpyright" to use basedpyright instead of pyright.
vim.g.lazyvim_python_lsp = "pylsp"
vim.g.lazyvim_python_ruff = "ruff_lsp"
