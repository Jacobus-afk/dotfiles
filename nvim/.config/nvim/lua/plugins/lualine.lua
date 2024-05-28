return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, --, 'rmagatti/auto-session' },
  event = 'VeryLazy',
  keys = {
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  },
  config = function()
    require('lualine').setup {
      -- sections = { lualine_c = { require('auto-session.lib').current_session_name } },
    }
  end,
}
