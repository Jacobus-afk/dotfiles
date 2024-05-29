return {
  'AckslD/swenv.nvim',
  config = function()
    local swenv = require 'swenv'
    local Path = require 'plenary.path'

    local get_envs = function(env_path)
      local venvs = {}
      if env_path == nil then
        return venvs
      end
      local scan_dir = require('plenary.scandir').scan_dir
      local paths = scan_dir(env_path, { depth = 3, silent = true, search_pattern = 'activate$' })
      for _, path in ipairs(paths) do
        table.insert(venvs, {
          name = Path:new(path):make_relative(base_path),
          path = path,
        })
      end
    end

    swenv.setup {
      venvs_path = vim.fn.getcwd(),
      set_env = function(env_name)
        local paths = get_envs(vim.fn.getcwd())
      end,
      post_set_venv = function(venv)
        vim.cmd 'LspRestart'
      end,
    }
  end,
}
