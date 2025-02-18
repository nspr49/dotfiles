package.path = package.path .. ";../?.lua"
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = require("plugins.keymaps.all").flash(),
}
