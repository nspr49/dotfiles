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
      on_highlights = function(highlights)
        local colors = require('eldritch.colors').default
        local highlight_defs = {
          BlinkCmpMenuBorder = {
            bg = nil,
            fg = colors.magenta2
          },

          BlinkCmpMenu = {
            bg = nil,
          },
          BlinkCmpKindFunction = {
            fg = colors.cyan,
            bg = nil,
          },
          BlinkCmpKindEnum = { fg = colors.magenta },
          BlinkCmpKindFile = { fg = colors.bright_cyan },
          BlinkCmpKindClass = { fg = colors.orange },
          BlinkCmpKindField = { fg = colors.bright_green },
          BlinkCmpKindProperty = { fg = colors.bright_green },
          BlinkCmpKindFolder = { fg = colors.cyan },
          BlinkCmpKindValue = { fg = colors.bright_red },
          BlinkCmpKindVariable = { fg = colors.purple },
          BlinkCmpKindKeyword = { fg = colors.bright_red },
          BlinkCmpKindInterface = { fg = colors.yellow },
          BlinkCmpKindText = { fg = colors.bright_green },
          BlinkCmpKindSnippet = { fg = colors.magenta2 },
          BlinkCmpKindMethod = { bg = nil, fg = colors.orange },
          BlinkCmpKindConstant = { bg = nil, fg = colors.magenta },
          BlinkCmpKindStruct = { bg = nil, fg = colors.magenta },
          BlinkCmpKindModule = { bg = nil, fg = colors.yellow },
          BlinkCmpLabel = { bg = nil, fg = colors.fg },
          BlinkCmpMenuSelection = { bg = colors.pink },
          BlinkCmpLabelDetail = { bg = nil, fg = colors.fg },
          BlinkCmpKindDefault = { bg = nil, fg = colors.fg },
          BlinkCmpLabelGhostText = { bg = nil, fg = colors.terminal_black },
          BlinkCmpGhostText = { bg = nil, fg = colors.fg },
          BlinkCmpLabelDescription = { bg = nil, fg = colors.fg },
          BlinkCmpSignatureHelp = { bg = nil, fg = colors.fg },
          WinBar = { bg = nil },
          StatusLine = { bg = nil },
          Headline1Bg = { bg = colors.green, fg = colors.terminal_black },
          Headline2Bg = { bg = colors.magenta, fg = colors.terminal_black },
          Headline3Bg = { bg = colors.pink, fg = colors.terminal_black },
          Headline4Bg = { bg = colors.cyan, fg = colors.terminal_black },
          RenderMarkdownH1Bg = { bg = colors.green, fg = colors.terminal_black },
          RenderMarkdownH2Bg = { bg = colors.magenta, fg = colors.terminal_black },
          RenderMarkdownH3Bg = { bg = colors.pink, fg = colors.terminal_black },
          RenderMarkdownH4Bg = { bg = colors.cyan, fg = colors.terminal_black },


          Pmenu = {
            bg = nil,
          },


          SnacksPickerBorder = { fg = colors.pink
          }

        }
        for group, props in pairs(highlight_defs) do
          highlights[group] = props
        end
      end


    },

  }
}
