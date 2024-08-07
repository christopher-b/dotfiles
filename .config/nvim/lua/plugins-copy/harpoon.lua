return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup()

    -- Use Telescope as UI
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end


    vim.keymap.set("n", "<leader>hy", function() harpoon:list():append() end, { desc = "Harpoon append" })
    vim.keymap.set("n", "<leader>hg", function() toggle_telescope(harpoon:list()) end,
      { desc = "Open harpoon window" })

    -- vim.keymap.set("n", "<leader>ho", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    --   { desc = "Harpoon toggle" })

    vim.keymap.set("n", "<leader>ha", function() harpoon:list():select(1) end, { desc = "Harpoon select 1" })
    vim.keymap.set("n", "<leader>hs", function() harpoon:list():select(2) end, { desc = "Harpoon select 2" })
    vim.keymap.set("n", "<leader>hd", function() harpoon:list():select(3) end, { desc = "Harpoon select 3" })
    vim.keymap.set("n", "<leader>hf", function() harpoon:list():select(4) end, { desc = "Harpoon select 4" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hj", function() harpoon:list():prev() end, { desc = "Harpoon prev" })
    vim.keymap.set("n", "<leader>hk", function() harpoon:list():next() end, { desc = "Harpoon next" })
  end,
}
