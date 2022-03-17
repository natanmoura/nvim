local M = {}

function M.config()
  -- local status_ok, gruvbox_flat = pcall(require, "gruvbox_flat")
  -- if not status_ok then
  --   return
  -- end
  -- Example config in Lua
  -- vim.g.gruvbox_italic_functions = true
  -- vim.g.gruvbox_sidebars = { "qf", "vista_kind", "terminal", "packer" }

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  -- vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }

  vim.g.gruvbox_italic = true
  vim.cmd('colorscheme gruvbox-flat')
end

return M
