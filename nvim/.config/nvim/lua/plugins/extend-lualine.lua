local function get_venv(variable)
  local venv = os.getenv(variable)
  if venv ~= nil and string.find(venv, "/") then
    local orig_venv = venv
    for w in orig_venv:gmatch("([^/]+)") do
      venv = w
    end
    venv = string.format("%s", venv)
  end
  return venv
end

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- opts.options.always_divide_middle = true

      table.insert(opts.sections.lualine_a, {
        function()
          local venv = get_venv("VIRTUAL_ENV") or "NO ENV"
          return " " .. venv
        end,
        cond = function()
          return vim.bo.filetype == "python"
        end,
      })

      opts.sections.lualine_z = {}

      opts.winbar = {
        lualine_b = {
          {
            "filename",
            path = 3,
            symbols = {
              modified = " ●",
            },
          },
        },
      }
      opts.inactive_winbar = {
        lualine_b = {
          {
            "filename",
            path = 3,
            symbols = {
              modified = " ●",
            },
          },
        },
      }
    end,
  },
}
