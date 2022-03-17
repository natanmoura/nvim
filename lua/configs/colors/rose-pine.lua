local M = {}

function M.config()
  local status_ok, rose_pine = pcall(require, "rose-pine")
  if not status_ok then
    return
  end

  rose_pine.setup {
	-- 'main'|'moon'
    dark_variant = 'main',
    bold_vert_split = false,
    dim_nc_background = false,
    disable_background = false,
    disable_float_background = true,
    disable_italics = true,
    -- string hex value or named color from https://www.rosepinetheme.com/palette
    groups = {
      border = 'highlight_med',
      comment = 'highlight_high',
      link = 'iris',
      punctuation = 'subtle',

      error = 'love',
      hint = 'iris',
      info = 'foam',
      warn = 'gold',

      headings = {
        h1 = 'iris',
        h2 = 'foam',
        h3 = 'rose',
        h4 = 'gold',
        h5 = 'pine',
        h6 = 'foam',
        }
      -- or set all headings at once
      -- headings = 'subtle'
    },

    highlights = {
      LineNr = {
        fg = 'highlight_high'
      },
    }
  }

  -- set colorscheme after options
  vim.cmd('colorscheme rose-pine')

end

return M
