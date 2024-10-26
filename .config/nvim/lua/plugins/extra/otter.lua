return {
  'jmbuhr/otter.nvim',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
  },
  opts = {},
  lazy = false,
  config = function()
    require("otter").setup()
  end
}
