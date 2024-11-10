package.path = package.path .. ";../?.lua"
return {
  "folke/flash.nvim",
  lazy = false,
  --event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = require("plugins.keymaps.all").flash(),
}
