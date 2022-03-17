local M = {}

function M.config()
  local status_ok, kanagawa = pcall(require, "kanagawa")
  if not status_ok then
    return
  end
  kanagawa.setup{
    undercurl = true,           -- enable undercurls
    commentStyle = "NONE",
    functionStyle = "NONE",
    keywordStyle = "NONE",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "NONE",
    specialReturn = true,       -- special highlight for the return keyword
    specialException = true,    -- special highlight for exception handling keywords
    transparent = false,        -- do not set background color
    dimInactive = true,        -- dim inactive window `:h hl-NormalNC`
    colors = {},
    overrides = {},
  }
  vim.cmd('colorscheme kanagawa')
end

return M
