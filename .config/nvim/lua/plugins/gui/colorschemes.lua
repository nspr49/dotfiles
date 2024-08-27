return {
  { "Mofiqul/dracula.nvim" },
  {"sainnhe/everforest"},
  {"folke/tokyonight.nvim"},
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {"rebelot/kanagawa.nvim"},
  {"scottmckendry/cyberdream.nvim"},
  {"shaunsingh/nord.nvim"},
  dependencies = {
    "nvim-treesitter"
  },

  config = function ()
    require("catppuccin").setup({
      flavour="mocha",
      color_overrides = {
      }
    })
  end

}
