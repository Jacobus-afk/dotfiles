local function get_venv(variable)
  local venv = os.getenv(variable)
  if venv ~= nil and string.find(venv, '/') then
    local orig_venv = venv
    for w in orig_venv:gmatch '([^/]+)' do
      venv = w
    end
    venv = string.format('%s', venv)
  end
  return venv
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, --, 'rmagatti/auto-session' },
  event = 'VeryLazy',
  keys = {
    -- { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    -- { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  },
  config = function()
    require('lualine').setup {
      -- options = {
      --   always_divide_middle = true,
      -- },
      sections = {
        lualine_a = {
          {
            function()
              local venv = get_venv 'VIRTUAL_ENV' or 'NO ENV'
              return ' ' .. venv
            end,
            cond = function()
              return vim.bo.filetype == 'python'
            end,
          },
        },

        --       lualine_c = {
        --         -- { 'filename', path = 1 },
        --         -- {
        --         --   require('nvim-possession').status,
        --         --   cond = function()
        --         --     return require('nvim-possession').status() ~= nil
        --         --   end,
        --         -- },
        --       },
      },
      winbar = {
        -- lualine_a = {
        --   {
        --     'buffers',
        --     mode = 3,
        --   },
        -- },
        lualine_b = {
          {
            'filename',
            path = 3,
            symbols = {
              modified = ' ●',
            },
          },
        },
      },
      inactive_winbar = {
        -- lualine_a = {
        --   {
        --     'buffers',
        --     mode = 1,
        --   },
        -- },
        lualine_b = {
          {
            'filename',
            path = 3,
            symbols = {
              modified = ' ●',
            },
          },
        },
      },
    }
  end,
}
