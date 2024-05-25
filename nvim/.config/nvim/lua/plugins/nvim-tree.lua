return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.opt.termguicolors = true
    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer

    local HEIGHT_RATIO = 0.8 -- You can change this
    local WIDTH_RATIO = 0.5 -- You can change this too

    local function my_on_attach(bufnr)
      local api = require("nvim-tree.api")

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      local function collapse_node()
        -- local node = api.tree.get_node_under_cursor()
        api.node.navigate.parent_close()
      end

      local function edit_or_open()
        local node = api.tree.get_node_under_cursor()

        if node.nodes ~= nil then
          -- expand or collapse folder
          api.node.open.edit()
        else
          -- open file
          api.node.open.edit()
          -- Close the tree if file was opened
          api.tree.close()
        end
      end

      -- open as vsplit on current node
      -- local function vsplit_preview()
      --   local node = api.tree.get_node_under_cursor()
      --
      --   if node.nodes ~= nil then
      --     -- expand or collapse folder
      --     api.node.open.edit()
      --   else
      --     -- open file as vsplit
      --     api.node.open.vertical()
      --   end
      --
      --   -- Finally refocus on tree if it was lost
      --   api.tree.focus()
      -- end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
      vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
      vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
      -- vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
      vim.keymap.set("n", "h", collapse_node, opts("Collapse"))
      vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
    end

    nvimtree.setup({
      on_attach = my_on_attach,
      disable_netrw = true,
      hijack_netrw = true,
      respect_buf_cwd = true,
      sync_root_with_cwd = true,
      view = {
        relativenumber = true,
        float = {
          enable = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
            return {
              border = "rounded",
              relative = "editor",
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
          end,
        },
        width = function()
          return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
        end,
      },
    })
  end,
}
