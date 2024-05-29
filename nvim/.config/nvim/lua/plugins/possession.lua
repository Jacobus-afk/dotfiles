return {
  'gennaro-tedesco/nvim-possession',
  dependencies = {
    'ibhagwan/fzf-lua',
  },
  config = true,
  init = function()
    local possession = require 'nvim-possession'
    vim.keymap.set('n', '<leader>wl', function()
      possession.list()
    end, { desc = '[L]ist sessions' })
    vim.keymap.set('n', '<leader>wn', function()
      possession.new()
    end, { desc = '[N]ew session' })
    vim.keymap.set('n', '<leader>wu', function()
      possession.update()
    end, { desc = '[U]pdate session' })
    vim.keymap.set('n', '<leader>wd', function()
      possession.delete()
    end, { desc = '[D]elete session' })

    possession.setup {
      autoload = false, -- default false
      autosave = true,
      autoswitch = {
        enable = true, -- default false
      },
      -- post_hook = function()
      --   -- require("FTerm").open()
      --   require('nvim-tree.api').tree.toggle(false, true)
      --   vim.lsp.buf.format()
      -- end,
    }
  end,
}
