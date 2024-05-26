require('lazy').setup({
  require 'plugins.one-liners',
  require 'plugins.colorscheme',
  require 'plugins.treesitter',
  require 'plugins.gitsigns',
  require 'plugins.which-key',
  require 'plugins.telescope',
  require 'plugins.cmp',
  require 'plugins.lspconfig',
  require 'plugins.conform',
  require 'plugins.lint',
  require 'plugins.todo-comments',
  -- TODO: add fugitive, use primeagen's config?
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et