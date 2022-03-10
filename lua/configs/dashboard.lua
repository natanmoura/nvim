local M = {}

function M.config()
  local g = vim.g
  local fn = vim.fn

  local plugins_count = fn.len(fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))

  g.dashboard_disable_statusline = 1
  g.dashboard_default_executive = "telescope" g.dashboard_custom_header = {
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    " ",
    "|￣￣￣￣￣￣￣￣|",
    "|  Get to work.  |",
    "|＿＿＿＿＿＿＿＿|",
    " ⠀⠀⠀⠀(\\__/)||",
    "   ⠀⠀(•ㅅ•)||",
    "⠀   ⠀/ 　 づ",
  }

  g.dashboard_custom_section = {
    a = { description = { "   Find File    " }, command = "Telescope find_files" },
    b = { description = { "   New File     " }, command = "DashboardNewFile" },
    c = { description = { "   Projects     " }, command = "Telescope projects" },
    d = { description = { "   Recents File " }, command = "Telescope oldfiles" },
    e = { description = { "   Find Word    " }, command = "Telescope live_grep" },
    f = { description = { "   Last Session " }, command = "SessionLoad" },
  }

  g.dashboard_custom_footer = {
    " Loaded " .. plugins_count .. " plugins ",
  }
end

return M
