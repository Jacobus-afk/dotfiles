return {
  "neovim/nvim-lspconfig",

  opts = function(_, opts)
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = {
      "gr",
      function()
        vim.cmd("Telescope lsp_references show_line=false")
      end,
      desc = "References",
    }

    opts.servers.pylsp.settings = {
      pylsp = {
        plugins = {
          {
            jedi_completion = {
              fuzzy = true,
              include_function_objects = true,
              include_class_objects = true,
            },

            --       flake8 = { enabled = false },
            --       yapf = { enabled = false },
            --       autopep8 = { enabled = false },
            pyflakes = { enabled = false },
            --       pylint = { enabled = false },
            pycodestyle = {
              enabled = false,
              -- ignore = { 'W391', 'W504' },
              -- maxLineLength = 110,
            },
            --       mccabe = { enabled = false },
          },
        },
      },
    }
  end,
}
