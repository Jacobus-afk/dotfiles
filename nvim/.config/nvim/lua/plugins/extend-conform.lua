return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["python"] = { "ruff_organize_imports", "black" },
        ["htmldjango"] = { "djhtml" },
      },
      formatters = {
        black = {
          prepend_args = { "--line-length", "110" },
        },
        ruff_organize_imports = {
          append_args = { "--line-length", "110" },
        },
        djhtml = {
          inherit = false,
          command = "djhtml",
          args = {
            "$FILENAME",
            "--tabwidth",
            "2",
          },
          stdin = false,
        },
        -- djlint = {
        --   append_args = {
        --     "--reformat",
        --     "--format-css",
        --     "--format-js",
        --     "--indent",
        --     "2",
        --     "--indent-css",
        --     "2",
        --     "--indent-js",
        --     "2",
        --   },
        -- },
      },
    },
  },
}
