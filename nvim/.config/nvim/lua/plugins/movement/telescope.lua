return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim',
    "sharkdp/fd", },
  config = function()
    local telescope = require("telescope")
    telescope.setup {
      pickers = {
        find_files = {
          file_ignore_patterns = {
            "node_modules",
            "target"
          },

          --hidden=true -- dont do thios because idc about .git
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        }
      }
    }
  end
}
