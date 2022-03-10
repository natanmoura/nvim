local M = {}

function M.config()
  local status_ok, bufferline = pcall(require, "bufferline")
  if not status_ok then
    return
  end

  local colors = {
    red = "#eb6f92",
    red_1 = "#eb6f92",
    grey = "#908caa",
    grey_1 = "#6e6a86",
    grey_2 = "#e0def4",
    black = "#191724",
    black_1 = "#1f1d2e",
    black_2 = "#26233a",
    green = "#31748f",
    none = "NONE",
  } 

  bufferline.setup {
    options = {
      numbers = "none",
      close_command = "Bdelete! %d",
      right_mouse_command = "Bdelete! %d",
      left_mouse_command = "buffer %d",
      middle_mouse_command = nil,
      offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
      buffer_close_icon = "",
      modified_icon = "",
      close_icon = "",
      show_close_icon = false,
      left_trunc_marker = "",
      right_trunc_marker = "",
      max_name_length = 30,
      max_prefix_length = 30,
      tab_size = 20,
      show_tab_indicators = true,
      enforce_regular_tabs = true,
      view = "multiwindow",
      show_buffer_close_icons = true,
      separator_style = "thin",
      always_show_bufferline = true,
      diagnostics = false,
    },

    highlights = {
      background = {
        guifg = colors.grey_1,
        guibg = colors.black_2,
      },

      -- Buffers
      buffer_selected = {
        guifg = colors.grey,
        guibg = colors.black,
        gui = colors.none,
      },
      buffer_visible = {
        guifg = colors.grey,
        guibg = colors.black,
      },

      -- Diagnostics
      error = {
        guifg = colors.red_1,
        guibg = colors.red_1,
      },
      error_diagnostic = {
        guifg = colors.red_1,
        guibg = colors.red_1,
      },

      -- Close buttons
      close_button = {
        guifg = colors.grey_1,
        guibg = colors.black_2,
      },
      close_button_visible = {
        guifg = colors.grey_2,
        guibg = colors.black,
      },
      close_button_selected = {
        guifg = colors.red,
        guibg = colors.black,
      },
      fill = {
        guifg = colors.grey_1,
        guibg = colors.black_2,
      },
      indicator_selected = {
        guifg = colors.black,
        guibg = colors.black,
      },

      -- Modified
      modified = {
        guifg = colors.red,
        guibg = colors.black_2,
      },
      modified_visible = {
        guifg = colors.grey,
        guibg = colors.black,
      },
      modified_selected = {
        guifg = colors.green,
        guibg = colors.black,
      },

      -- Separators
      separator = {
        guifg = colors.black_2,
        guibg = colors.black_2,
      },
      separator_visible = {
        guifg = colors.black,
        guibg = colors.black,
      },
      separator_selected = {
        guifg = colors.black_2,
        guibg = colors.black_2,
      },

      -- Tabs
      tab = {
        guifg = colors.grey,
        guibg = colors.black,
      },
      tab_selected = {
        guifg = colors.black,
        guibg = colors.black,
      },
      tab_close = {
        guifg = colors.black,
        guibg = colors.black,
      },
    },
  }
end

return M
