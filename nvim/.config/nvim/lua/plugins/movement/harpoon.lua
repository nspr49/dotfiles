return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },

  config = function()
    package.path = package.path .. ";../?.lua"
    require("harpoon").setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      }
    })
    vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#63698c')
    vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
    vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#7aa2f7')
    vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#7aa2f7')
    vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')


    local keymaps = require("plugins.keymaps.all");
    keymaps.harpoon();
  end
}
