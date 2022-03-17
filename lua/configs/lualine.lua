local M = {}

function M.config()
  local status_ok, lualine = pcall(require, "lualine")
  if not status_ok then
    return
  end

  local diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    sections = { "error", "warn" },
    symbols = { error = " ", warn = " " },
    colored = true,
    update_in_insert = false,
    always_visible = false,
  }

  local diff = {
    "diff",
    colored = false,
    symbols = { added = "+", modified = "~", removed = "-" }, -- changes diff symbols
    always_visible = true,
    -- cond = hide_in_width,
  }

  local mode = {
    "mode",
    -- fmt = function(str)
    -- 	return "-- " .. str .. " --"
    -- end,
  }

  local filetype = {
    "filetype",
    icons_enabled = true,
    colored = false,
  }

  local branch = {
    "branch",
    icons_enabled = true,
    icon = "",
  }

  -- cool function for progress
  local function progress()
    local current_line = vim.fn.line(".")
    local total_lines = vim.fn.line("$")
    local chars = { "  ", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end

  local function clock()
    return " "..os.date("%H:%M")
  end

  local function lsp_progress(_, is_active)
    if not is_active then
      return
    end
    local messages = vim.lsp.util.get_progress_messages()
    if #messages == 0 then
      return ""
    end
    -- dump(messages)
    local status = {}
    for _, msg in pairs(messages) do
      local title = ""
      if msg.title then
        title = msg.title
      end
      -- if msg.message then
      --   title = title .. " " .. msg.message
      -- end
      table.insert(status, (msg.percentage or 0) .. "%% " .. title)
    end
    local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    local ms = vim.loop.hrtime() / 1000000
    local frame = math.floor(ms / 120) % #spinners
    return table.concat(status, " | ") .. " " .. spinners[frame + 1]
  end

  vim.cmd("au User LspProgressUpdate let &ro = &ro")

  -- local spaces = function()
  -- 	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
  -- end

  lualine.setup({
    options = {
      icons_enabled = true,
      theme = "auto",
      component_separators = { left = "|", right = "|" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { mode },
      lualine_b = { branch, "filename"},
      lualine_c = { diagnostics },
      lualine_x = { lsp_progress, diff },
      lualine_y = { filetype },
      lualine_z = { clock },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  })
end

return M
