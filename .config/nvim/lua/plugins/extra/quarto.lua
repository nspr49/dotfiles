-- plugins/quarto.lua

package.path = package.path .. ";../?.lua"
return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",

      "benlubas/molten-nvim",
    },
    ft = { "Markdown", "quarto" },
    config = function()
      require('quarto').setup({
        debug = false,
        closePreviewOnExit = true,
        lspFeatures = {
          enabled = true,
          chunks = "curly",
          languages = { "r", "python" },
          diagnostics = {
            enabled = true,
            triggers = { "BufWritePost" },
          },
          completion = {
            enabled = true,
          },
        },
        codeRunner = {
          enabled = true,
          default_method = "molten", -- 'molten' or 'slime'
        },
      })
      require("plugins.keymaps.all").quattro()
    end
  },

}
