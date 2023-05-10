return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  "p00f/clangd_extensions.nvim", -- install lsp plugin
  "simrat39/rust-tools.nvim",    -- add lsp plugin
  -- {
  --   "xiyaowong/transparent.nvim",
  --   lazy = false,
  --   config = function()
  --     require("transparent").setup({
  --       groups = { -- table: default groups
  --         'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
  --         'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
  --         'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
  --         'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  --       },
  --       extra_groups = {
  --         "NormalFloat",     -- plugins which have float panel such as Lazy, Mason, LspInfo
  --         "NvimTreeNormal",  -- NvimTree
  --       },                   -- table: additional groups that should be cleared
  --       exclude_groups = {}, -- table: groups you don't want to clear
  --     })
  --   end,
  -- }, -- add transparent commands

  {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
          -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = true,
        show_end_of_buffer = false, -- show the '~' characters after the end of buffers
        term_colors = false,
        dim_inactive = {
          enabled = false,
          shade = "dark",
          percentage = 0.15,
        },
        no_italic = false, -- Force no italic
        no_bold = false,   -- Force no bold
        styles = {
          comments = { "italic" },
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          telescope = true,
          notify = false,
          mini = false,
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })
    end,
  },

  {
    'KadoBOT/nvim-spotify',
    lazy = false,
    dependencies = 'nvim-telescope/telescope.nvim',
    config = function()
      local spotify = require 'nvim-spotify'

      spotify.setup {
        -- default opts
        status = {
          update_interval = 10000, -- the interval (ms) to check for what's currently playing
          format = '%s %t by %a'   -- spotify-tui --format argument
        }
      }
    end,
    build = 'make'
  },

  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require('copilot').setup({
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>"
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.4
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = false,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          lua = true,
          cpp = true,
          yaml = true,
          markdown = true,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = 'node', -- Node.js version must be > 16.x
        server_opts_overrides = {},
      })
    end,
  },

  {
    "zbirenbaum/copilot-cmp",
    lazy = false,
    dependencies = { "copilot.lua" },
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end
  },

  -- {
  --   'jvgrootveld/telescope-zoxide',
  --   dependencies = {
  --     'nvim-lua/popup.nvim',
  --     'nvim-lua/plenary.nvim',
  --     'nvim-telescope/telescope.nvim',
  --   },
  --   config = function()
  --     local z_utils = require("telescope._extensions.zoxide.utils")
  --
  --     require('telescope').setup {
  --       -- (other Telescope configuration...)
  --       extensions = {
  --         zoxide = {
  --           prompt_title = "[ Walking on the shoulders of TJ ]",
  --           mappings = {
  --             default = {
  --               after_action = function(selection)
  --                 print("Update to (" .. selection.z_score .. ") " .. selection.path)
  --               end
  --             },
  --             ["<C-s>"] = {
  --               before_action = function(selection) print("before C-s") end,
  --               action = function(selection)
  --                 vim.cmd.edit(selection.path)
  --               end
  --             },
  --             -- Opens the selected entry in a new split
  --             ["<C-q>"] = { action = z_utils.create_basic_command("split") },
  --           },
  --         }
  --       }
  --     }
  --   end
  -- },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    config = function()
      require("tokyonight").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        style = "storm",        -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
        light_style = "day",    -- The theme is used when the background is set to light
        transparent = true,     -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "transparent",       -- style for sidebars, see below
          floats = "normal",              -- style for floating windows
        },
        sidebars = { "qf", "help" },      -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        day_brightness = 0.3,             -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        dim_inactive = false,             -- dims inactive windows
        lualine_bold = false,             -- When `true`, section headers in the lualine theme will be bold

        --- You can override specific color groups to use other groups or a hex color
        --- function will be called with a ColorScheme table
        ---@param colors ColorScheme
        on_colors = function(colors)
        end,

        --- You can override specific highlights to use other groups or a hex color
        --- function will be called with a Highlights and ColorScheme table
        ---@param highlights Highlights
        ---@param colors ColorScheme
        on_highlights = function(highlights, colors)
        end,
      })
    end
  },

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
