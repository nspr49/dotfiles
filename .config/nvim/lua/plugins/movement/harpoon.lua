return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },

  config = function()
    local harpoon = require("harpoon");

    harpoon:setup()
    local conf = require("telescope.config").values

    local function toggle_telescope(harpoon_files)
      harpoon.ui:toggle_quick_menu(harpoon:list(), { bg = "##FF0000" })
    end
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>h", function() toggle_telescope(harpoon:list()) end)
    --vim.keymap.set("n", "<leader>h", function() toggle_telescope(harpoon:list()) end)

    vim.keymap.set("n", "<C-n>", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<C-m>", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<C-p>", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
  end
}
