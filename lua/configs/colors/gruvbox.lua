local M = {}

function M.config()
  vim.opt.termguicolors = true
  vim.o.background = "dark" -- or "light" for light mode
  vim.cmd("colorscheme gruvbox")
end

return M
