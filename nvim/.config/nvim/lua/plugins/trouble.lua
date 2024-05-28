return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    {
      '<leader>xx',
      function()
        require('trouble').toggle()
      end,
      desc = 'Toggle Trouble',
    },
    {
      '<leader>xw',
      function()
        require('trouble').toggle 'workspace_diagnostics'
      end,
      desc = 'workspace_diagnostics',
    },
    {
      '<leader>xd',
      function()
        require('trouble').toggle 'document_diagnostics'
      end,
      desc = 'document_diagnostics',
    },
    {
      '<leader>xq',
      function()
        require('trouble').toggle 'quickfix'
      end,
      desc = 'quickfix',
    },
    {
      '<leader>xl',
      function()
        require('trouble').toggle 'loclist'
      end,
      desc = 'loclist',
    },
    {
      'gR',
      function()
        require('trouble').toggle 'lsp_references'
      end,
      desc = 'lsp_references',
    },
  },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
