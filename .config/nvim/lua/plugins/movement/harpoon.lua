return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },

  config = function()
    package.path = package.path .. ";../?.lua"

    local keymaps = require("plugins.keymaps.all");
    keymaps.harpoon();
  end
}
