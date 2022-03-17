local M = {}

function M.config()
  local status_ok, nord = pcall(require, "nord")
  if not status_ok then
    return
  end

  -- nord.setup {
  --   options = {
  --
  --   theme = "nord"
  --   }
  -- }
  vim.g.nord_contrast = false
  vim.g.nord_borders = true
  vim.g.nord_disable_background = false
  vim.g.nord_italic = false

  vim.cmd('colorscheme nord')
end

return M
