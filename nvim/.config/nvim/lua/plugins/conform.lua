return {
  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    -- opts = {
    --   notify_on_error = false,
    --   format_on_save = function(bufnr)
    --     -- Disable "format_on_save lsp_fallback" for languages that don't
    --     -- have a well standardized coding style. You can add additional
    --     -- languages here or re-enable it for the disabled ones.
    --     local disable_filetypes = { c = true, cpp = true }
    --     if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
    --       return
    --     end
    --     return {
    --       timeout_ms = 500,
    --       lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
    --     }
    --   end,
    --   formatters_by_ft = {
    --     lua = { 'stylua' },
    --     -- Conform can also run multiple formatters sequentially
    --     python = { 'isort', 'black' },
    --     markdown = { 'mdformat' },
    --     --
    --     -- You can use a sub-list to tell conform to run *until* a formatter
    --     -- is found.
    --     -- javascript = { { "prettierd", "prettier" } },
    --   },
    -- },
    config = function()
      -- disable autoformat for now
      vim.g.disable_autoformat = true
      require('conform').setup {
        notify_on_error = false,
        format_on_save = function(bufnr)
          -- Disable "format_on_save lsp_fallback" for languages that don't
          -- have a well standardized coding style. You can add additional
          -- languages here or re-enable it for the disabled ones.
          local disable_filetypes = { c = true, cpp = true }
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return {
            timeout_ms = 500,
            lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
          }
        end,
        formatters_by_ft = {
          lua = { 'stylua' },
          -- Conform can also run multiple formatters sequentially
          python = { 'isort', 'black' },
          markdown = { 'mdformat' },
          --
          -- You can use a sub-list to tell conform to run *until* a formatter
          -- is found.
          -- javascript = { { "prettierd", "prettier" } },
        },
        formatters = {
          black = {
            prepend_args = { '--line-length', '110' },
          },
        },
      }
      vim.api.nvim_create_user_command('FormatOnSaveDisable', function(args)
        if args.bang then
          -- FormatDisable! just disables autoformat for current buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = 'Disable autoformat-on-save',
        bang = true,
      })
      vim.api.nvim_create_user_command('FormatOnSaveEnable', function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = 'Re-enable autoformat-on-save',
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
