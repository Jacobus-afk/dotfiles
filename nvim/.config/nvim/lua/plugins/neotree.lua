return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  keys = {
    {
      '<leader>--',
      function()
        require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
        -- require('neo-tree.command').execute { toggle = true, dir = vim.fn.expand '%:p:h' }
      end,
      desc = 'Explorer NeoTree (cwd)',
    },
    {
      '<leader>-f',
      ':Neotree reveal<CR>',
      -- function()
      --   require('neo-tree.command').execute { toggle = true, dir = vim.fn.expand '%:p:h' }
      -- end,
      desc = 'Explorer NeoTree (current file)',
    },
    {
      '<leader>oe',
      function()
        require('neo-tree.command').execute { source = 'git_status', toggle = true }
      end,
      desc = 'Git Explorer',
    },
  },

  config = function()
    require('neo-tree').setup {
      window = {
        mappings = {
          ['l'] = 'open',
        },
        filesystem = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
        },
        -- buffers = { follow_current_file = { enable = true } },
      },

      -- default_component_configs = {
      --   -- filesystem = {
      --   --   follow_current_file = {
      --   --     enabled = true,
      --   --     leave_dirs_open = true,
      --   --   },
      --   -- },
      --   --   git_status = {
      --   --     symbols = {
      --   --       -- Change type
      --   --       added = '✚', -- but this is redundant info if you use git_status_colors on the name
      --   --       modified = '', -- but this is redundant info if you use git_status_colors on the name
      --   --       deleted = '✖', -- this can only be used in the git_status source
      --   --       renamed = '󰁕', -- this can only be used in the git_status source
      --   --       -- Status type
      --   --       untracked = '',
      --   --       ignored = '',
      --   --       unstaged = '󰄱',
      --   --       staged = '',
      --   --       conflict = '',
      --   --     },
      --   --   },
      -- },
    }
  end,
}
