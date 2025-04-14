-- From https://blob42.xiz/blog/neovim-diagnostic-filtering/
local M = {}

local original_handler = vim.diagnostic.handlers.virtual_text
local ns = vim.api.nvim_create_namespace("filter_diagnostics")

--- Filter diagnostics by their source.
-- @param diagnostics table The diagnostics to filter
-- @param source string The source name to filter by
-- @return table Filtered diagnostics matching the source
local filter_diagnostics = function(diagnostics, source)
  local filtered_diagnostics = {}

  for _, d in pairs(diagnostics) do
    if d.source == source then table.insert(filtered_diagnostics, d) end
  end

  return filtered_diagnostics
end

-- @param source string The diagnostic source to filter by (e.g., "eslint", "tsserver")
-- @usage M.filter("eslint") -- Show only ESLint diagnostics
-- @see filter_diagnostics
M.filter = function(source)
  local current_buf = vim.api.nvim_get_current_buf()

  -- Hide all diagnostics first to clear the current display
  vim.diagnostic.hide(nil, current_buf)
  vim.diagnostic.hide(ns, current_buf)

  -- Override the virtual_text handler to filter diagnostics by source
  vim.diagnostic.handlers.virtual_text = {
    show = function(_, bufnr, _, opts)
      -- get all diagnostics for local buffer
      local diagnostics = vim.diagnostic.get(bufnr)
      local filtered = filter_diagnostics(diagnostics, source)
      original_handler.show(ns, bufnr, filtered, opts)
    end,

    hide = function(_, bufnr)
      original_handler.hide(ns, bufnr)
    end,
  }

  -- Apply filtered diagnostics to current buffer if any exist
  local diagnostics = vim.diagnostic.get(current_buf)
  if #diagnostics > 0 then
    local filtered = filter_diagnostics(diagnostics, source)
    vim.diagnostic.show(ns, current_buf, filtered)
  end
end

vim.api.nvim_create_autocmd("DiagnosticChanged", {
  group = vim.api.nvim_create_augroup("diagnostic", { clear = true }),
  callback = function()
    M.filter("Standard Ruby")
  end,
})

return M
