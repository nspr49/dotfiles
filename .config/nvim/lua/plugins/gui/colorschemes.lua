return {
  { "Mofiqul/dracula.nvim" },
  {"sainnhe/everforest"},
  {"folke/tokyonight.nvim"},
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {"rebelot/kanagawa.nvim"},
  {"scottmckendry/cyberdream.nvim"},
  {"shaunsingh/nord.nvim"},
  {"uZer/pywal16.nvim"},
{
  "xero/evangelion.nvim",
  lazy = false,
  priority = 1000,
},
config = function ()
    require("catppuccin").setup({
      flavour="mocha",
      color_overrides = {
        all = {
        }
      },
      transparent_background = true;
    })
    require('tokyonight').setup({
      plugins = { markdown = true },
    })
  end

}
