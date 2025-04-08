local tree_actions = {
  {
    name = "Create",
    handler = require("nvim-tree.api").fs.create,
  },
  {
    name = "Remove",
    handler = require("nvim-tree.api").fs.remove,
  },
  {
    name = "Trash",
    handler = require("nvim-tree.api").fs.trash,
  },
  {
    name = "Rename",
    handler = require("nvim-tree.api").fs.rename,
  },
  {
    name = "Fully rename",
    handler = require("nvim-tree.api").fs.rename_sub,
  },
  {
    name = "Copy",
    handler = require("nvim-tree.api").fs.copy.node,
  },

  -- ... other custom actions you may want to display in the menu
}

local function tree_actions_menu(node)
  local entry_maker = function(menu_item)
    return {
      value = menu_item,
      ordinal = menu_item.name,
      display = menu_item.name,
    }
  end

  local finder = require("telescope.finders").new_table({
    results = tree_actions,
    entry_maker = entry_maker,
  })

  local sorter = require("telescope.sorters").get_generic_fuzzy_sorter()

  local default_options = {
    finder = finder,
    sorter = sorter,
    attach_mappings = function(prompt_buffer_number)
      local actions = require("telescope.actions")

      -- On item select
      actions.select_default:replace(function()
        local state = require("telescope.actions.state")
        local selection = state.get_selected_entry()
        -- Closing the picker
        actions.close(prompt_buffer_number)
        -- Executing the callback
        selection.value.handler(node)
      end)

      -- The following actions are disabled in this example
      -- You may want to map them too depending on your needs though
      actions.add_selection:replace(function() end)
      actions.remove_selection:replace(function() end)
      actions.toggle_selection:replace(function() end)
      actions.select_all:replace(function() end)
      actions.drop_all:replace(function() end)
      actions.toggle_all:replace(function() end)

      return true
    end,
  }

  -- Opening the menu
  require("telescope.pickers").new({ prompt_title = "Tree menu" }, default_options):find()
end

vim.keymap.set("n", "<C-Space>", tree_actions_menu, { buffer = buffer, noremap = true, silent = true })

-- OSC 52 clipboard integration
-- local function copy_osc52(text)
--   -- Remove trailing newline
--   local encoded = text:gsub('\n$', '')
--
--   -- Escape special characters
--   encoded = encoded:gsub('\\', '\\\\')
--   encoded = encoded:gsub('\n', '\\n')
--   encoded = encoded:gsub('\r', '\\r')
--   encoded = encoded:gsub('\t', '\\t')
--   encoded = encoded:gsub("'", "'\\\\''")
--
--   -- Base64 encode the string
--   local handle = io.popen("echo -n '" .. encoded .. "' | base64", 'r')
--   local base64_encoded = handle:read('*a')
--   handle:close()
--
--   -- Remove any newlines from base64 output
--   base64_encoded = base64_encoded:gsub('\n', '')
--
--   -- Create the OSC 52 sequence
--   local osc52 = string.format('\027]52;c;%s\027\\', base64_encoded)
--
--   -- Send to terminal
--   os.execute("echo -en '" .. osc52 .. "' > /dev/tty")
--
--   -- Show notification
--   local char_count = string.len(text)
--   local message = char_count .. " characters copied to clipboard"
--   vim.notify(message, vim.log.levels.INFO)
-- end
--
-- -- Set up a keybinding in Neovim
-- vim.keymap.set("v", "<leader>i", "y<cmd>lua copy_osc52(vim.fn.getreg("0"))<CR>",
--   { noremap = true })
