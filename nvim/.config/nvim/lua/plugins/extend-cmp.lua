return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        -- ["<Right>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
      })
      opts.window = {
        completion = {
          winblend = 0,
          border = opts.border or "rounded",
          winhighlight = opts.winhighlight or "Normal:MyHighlight,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          zindex = opts.zindex or 1001,
          scrolloff = opts.scrolloff or 0,
          col_offset = opts.col_offset or 0,
          side_padding = opts.side_padding or 1,
          scrollbar = opts.scrollbar == nil and true or opts.scrollbar,
        },
        documentation = {
          winblend = 0,
          border = opts.border or "rounded",
          winhighlight = opts.winhighlight or "Normal:MyHighlight,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
          zindex = opts.zindex or 1001,
          scrolloff = opts.scrolloff or 0,
          col_offset = opts.col_offset or 0,
          side_padding = opts.side_padding or 1,
          scrollbar = opts.scrollbar == nil and true or opts.scrollbar,
        },
      }
    end,
  },
}
