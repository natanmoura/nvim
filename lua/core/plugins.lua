local M = {}

local utils = require "core.utils"
local config = utils.settings()

local packer_status_ok, packer = pcall(require, "packer")
if not packer_status_ok then
  return
end

packer.startup {
  function(use)
    -- Plugin manager
    use {
      "wbthomason/packer.nvim",
    }

    -- Optimiser
    use {
      "lewis6991/impatient.nvim",
    }

    -- Lua functions
    use {
      "nvim-lua/plenary.nvim",
    }

    -- Popup API
    use {
      "nvim-lua/popup.nvim",
    }

    -- Boost startup time
    use {
      "nathom/filetype.nvim",
      config = function()
        vim.g.did_load_filetypes = 1
      end,
    }

    -- Cursorhold fix
    use {
      "antoinemadec/FixCursorHold.nvim",
      event = "BufRead",
      config = function()
        vim.g.cursorhold_updatetime = 100
      end,
    }

    -- Icons
    use {
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("configs.icons").config()
      end,
    }

    -- Bufferline
    use {
      "akinsho/bufferline.nvim",
      after = "nvim-web-devicons",
      config = function()
        require("configs.bufferline").config()
      end,
    }

    -- Better buffer closing
    use {
      "moll/vim-bbye",
      after = "bufferline.nvim",
    }

    -- File explorer
    use {
      "kyazdani42/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      config = function()
        require("configs.nvim-tree").config()
      end,
    }

    -- Statusline
    use {
      "nvim-lualine/lualine.nvim",
      after = "bufferline.nvim",
      config = function()
        require("configs.lualine").config()
      end,
    }

    -- Syntax highlighting
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      event = "BufRead",
      cmd = {
        "TSInstall",
        "TSInstallInfo",
        "TSInstallSync",
        "TSUninstall",
        "TSUpdate",
        "TSUpdateSync",
        "TSDisableAll",
        "TSEnableAll",
      },
      config = function()
        require("configs.treesitter").config()
      end,
    }

    -- Snippet engine
    use {
      "L3MON4D3/LuaSnip",
      config = function()
        require("luasnip/loaders/from_vscode").lazy_load()
      end,
      requires = {
        -- Snippet collections
        "rafamadriz/friendly-snippets",
      },
    }

    -- Completion engine
    use {
      "hrsh7th/nvim-cmp",
      event = "BufRead",
      config = function()
        require("configs.cmp").config()
      end,
    }

    -- Snippet completion source
    use {
      "saadparwaiz1/cmp_luasnip",
      after = "nvim-cmp",
    }

    -- Buffer completion source
    use {
      "hrsh7th/cmp-buffer",
      after = "nvim-cmp",
    }

    -- Path completion source
    use {
      "hrsh7th/cmp-path",
      after = "nvim-cmp",
    }

    -- LSP completion source
    use {
      "hrsh7th/cmp-nvim-lsp",
    }

    -- LSP manager
    use {
      "williamboman/nvim-lsp-installer",
      event = "BufRead",
      cmd = {
        "LspInstall",
        "LspInstallInfo",
        "LspPrintInstalled",
        "LspRestart",
        "LspStart",
        "LspStop",
        "LspUninstall",
        "LspUninstallAll",
      },
    }

    -- Built-in LSP
    use {
      "neovim/nvim-lspconfig",
      event = "BufRead",
      config = function()
        require "configs.lsp"
      end,
    }

    -- LSP enhancer
    use {
      "tami5/lspsaga.nvim",
      event = "BufRead",
      config = function()
        require("configs.lsp.lspsaga").config()
      end,
    }

    -- LSP symbols
    use {
      "simrat39/symbols-outline.nvim",
      cmd = "SymbolsOutline",
      config = function()
        require("configs.symbols-outline").config()
      end,
    }

    -- Formatting and linting
    use {
      "jose-elias-alvarez/null-ls.nvim",
      event = "BufRead",
      config = function()
        require "core.null-ls".config()
      end,
    }

    -- Fuzzy finder
    use {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      config = function()
        require("configs.telescope").config()
      end,
    }

    -- Fuzzy finder syntax support
    use {
      "nvim-telescope/telescope-fzf-native.nvim",
      run = "make",
    }

    -- Sessions picker
    use {
      "JoseConseco/telescope_sessions_picker.nvim",
    }

    -- Project management
    use {
      "ahmedkhalf/project.nvim",
      after = "telescope.nvim",
      config = function()
        require("configs.project").config()
      end
    }

   -- Git integration
    use {
      "lewis6991/gitsigns.nvim",
      event = "BufRead",
      config = function()
        require("configs.gitsigns").config()
      end,
    }

    -- Start screen
    use {
      "glepnir/dashboard-nvim",
      config = function()
        require("configs.dashboard").config()
      end,
    }

    -- Color highlighting
    use {
      "norcalli/nvim-colorizer.lua",
      event = "BufRead",
      config = function()
        require("configs.colorizer").config()
      end,
    }


    -- Autopairs
    use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
        require("configs.autopairs").config()
      end,
    }

    -- Tabout
    use {
      "abecodes/tabout.nvim",
      wants = "nvim-treesitter",
      config = function()
        require("configs.tabout").config()
      end
    }

    -- Surround
    use {
      "Mephistophiles/surround.nvim",
      config = function()
        require"surround".setup {mappings_style = "sandwich"}
      end,
    }

    -- Fugitive
    use {
      "tpope/vim-fugitive"
    }

    -- Repeat
    use {
      "tpope/vim-repeat"
    }
    -- Terminal
    use {
      "akinsho/nvim-toggleterm.lua",
      cmd = "ToggleTerm",
      config = function()
        require("configs.toggleterm").config()
      end,
    }

    -- Commentin
    use {
      "numToStr/Comment.nvim",
      event = "BufRead",
      config = function()
        require("configs.comment").config()
      end,
    }

    -- Pounce
    use {"rlane/pounce.nvim"}

    -- Indentation
    -- use {
    --   "lukas-reineke/indent-blankline.nvim",
    --   config = function()
    --     require("configs.indent-line").config()
    --   end,
    -- }
    --
    -- Keymaps popup
    use {
      "folke/which-key.nvim",
      config = function()
        require("configs.which-key").config()
      end,
    }

    -- Smooth scjolling
    use {
      "karb94/neoscroll.nvim",
      event = "BufRead",
      config = function()
        require("configs.neoscroll").config()
      end,
    }

    -- Colorscheme
    use {
      'rose-pine/neovim',
      as = 'rose-pine',
      tag = 'v1.*',
      config = function()
        require("configs.colors.rose-pine").config()

      end,
    }

    -- use {
    --   "eddyekofo94/gruvbox-flat.nvim",
    --   config = function()
    --     require("configs.colors.gruvbox-flat").config()
    --   end,
    -- }

    -- use {
    --   "ellisonleao/gruvbox.nvim",
    --   config = function()
    --     require("configs.colors.gruvbox").config()
    --   end,
    -- }

    -- use {
    --   "shaunsingh/nord.nvim",
    --   config = function()
    --     require("configs.colors.nord").config()
    --   end,
    -- }

    -- use {
    --   "rebelot/kanagawa.nvim",
    --   config = function()
    --     require("configs.colors.kanagawa").config()
    --   end,
    -- }

    -- User defined plugins
    if config.plugins and not vim.tbl_isempty(config.plugins) then
      for _, plugin in pairs(config.plugins) do
        use(plugin)
      end
    end
  end,
  config = {
    compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
    profile = {
      enable = true,
      threshold = 0.0001,
    },
    git = {
      clone_timeout = 300,
    },
    auto_clean = true,
    compile_on_sync = true,
  },
}

return M
