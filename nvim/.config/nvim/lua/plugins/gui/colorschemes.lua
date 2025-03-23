return {
  { "folke/tokyonight.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        color_overrides = {
          mocha = {
            --           mauve = "#EBD5DF",
            pink = "#907aa9",
            --flamingo = "#736C93",
            red = "#F6C0D3",
            crust = "#677A8B",
            peach = "#FD9B93",
            blue = "#C2E4F4",


          }
        },
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = true,
          flash = true,
          noice = true,
          dap_ui = true,
          dap = true,
          fzf = true,
          blink_cmp = true,
          ufo = true,
          telescope = {
            enabled = true,
          },
          snacks = true,
          which_key = true,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
        },
        custom_highlights = function(colors)
          return {
            CmpBorder = { bg = colors.mauve, fg = colors.mauve },
            Pmenu = { bg = nil, fg = colors.mauve },
            TelescopeBorder = { fg = colors.mauve },

            BlinkCmpKindInterface = { fg = colors.peach },
            BlinkCmpKindKeyword = { fg = colors.red },
            BlinkCmpKindEnum = { fg = colors.green },
            BlinkCmpKindText = { fg = colors.green },
            BlinkCmpKindProperty = { fg = colors.green },
            BlinkCmpKindSnippet = { fg = colors.mauve },
            BlinkCmpKindEnumMember = { fg = colors.red },
            BlinkCmpKindTypeParameter = { fg = colors.blue },

            FloatBorder = { fg = colors.mauve },
            LineNr = { fg = colors.text },


          }
        end
      })
    end
  },
  {
    "rose-pine/neovim",
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        highlight_groups = {
          TelescopeBorder = { fg = "highlight_high", bg = "none" },
          TelescopeNormal = { bg = "none" },
          TelescopePromptNormal = { bg = "none" },
          TelescopeResultsNormal = { fg = "subtle", bg = "none" },
          TelescopeSelection = { fg = "text", bg = "base" },
          TelescopeSelectionCaret = { fg = "rose", bg = "none" },
        },
      })
    end


  },
  {
    "xero/evangelion.nvim",
    lazy = false,
  },
  {
    "eldritch-theme/eldritch.nvim",
    lazy = false,
    priority = 1000,

    opts = {
      transparent = true,
      fzf_colors = {
        true,
        bg = "-1",
        gutter = "-1",

      },
      on_colors = function(global_colors)
        local color_definitions = {
        }
        for key, value in pairs(color_definitions) do
          global_colors[key] = value
        end
      end

    },


    config = function()
      local colors = require("eldritch.colors").default;

      require("eldritch").setup(opts);
      vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = colors.pink })

      --- blink
      vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { fg = colors.cyan })
      vim.api.nvim_set_hl(0, "BlinkCmpKindFunction", { fg = colors.cyan })
      vim.api.nvim_set_hl(0, "BlinkCmpKindEnum", { fg = colors.red })
      vim.api.nvim_set_hl(0, "BlinkCmpKindFile", { fg = colors.bright_cyan })
      vim.api.nvim_set_hl(0, "BlinkCmpKindClass", { fg = colors.orange })
      vim.api.nvim_set_hl(0, "BlinkCmpKindField", { fg = colors.bright_green })
      vim.api.nvim_set_hl(0, "BlinkCmpKindProperty", { fg = colors.bright_green })
      vim.api.nvim_set_hl(0, "BlinkCmpKindValue", { fg = colors.magenta })
      vim.api.nvim_set_hl(0, "BlinkCmpKindFolder", { fg = colors.cyan })
      vim.api.nvim_set_hl(0, "BlinkCmpKindValue", { fg = colors.bright_red })
      vim.api.nvim_set_hl(0, "BlinkCmpKindVariable", { fg = colors.purple })
      vim.api.nvim_set_hl(0, "BlinkCmpKindKeyword", { fg = colors.bright_red })
      vim.api.nvim_set_hl(0, "BlinkCmpKindInterface", { fg = colors.yellow })
      vim.api.nvim_set_hl(0, "BlinkCmpKindText", { fg = colors.bright_green })
      vim.api.nvim_set_hl(0, "BlinkCmpKindSnippet", { fg = colors.magenta2 })
      --vim.api.nvim_set_hl(0, "SnacksBackdrop_000000 ", { bg = colors.pink })
      --vim.api.nvim_set_hl(0, "SnacksBackdrop", { default = false, bg = colors.pink })
      vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.green })
    end
  }
}
