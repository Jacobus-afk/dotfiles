return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["python"] = { "ruff_organize_imports", "black" },
        ["htmldjango"] = { "djlint" },
      },
      formatters = {
        black = {
          prepend_args = { "--line-length", "110" },
        },
        ruff_organize_imports = {
          append_args = { "--line-length", "110" },
        },
      },
    },
  },
}
