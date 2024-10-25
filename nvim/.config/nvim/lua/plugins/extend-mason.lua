return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
      -- "djlint",
      -- "emmet-ls",
      "nginx-language-server",
      -- "vtsls",
    },
    ui = {
      border = "rounded",
    },
  },
}
