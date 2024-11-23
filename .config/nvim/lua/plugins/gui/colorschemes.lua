return {
  { "Mofiqul/dracula.nvim" },
  { "sainnhe/everforest" },
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim",              name = "catppuccin", priority = 1000 },
  { "rebelot/kanagawa.nvim" },
  { "scottmckendry/cyberdream.nvim" },
  { "shaunsingh/nord.nvim" },
  { "uZer/pywal16.nvim" },
  { "eldritch-theme/eldritch.nvim" },
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
}
