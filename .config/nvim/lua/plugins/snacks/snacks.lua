return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    indent = { enabled = false },
    input = { enabled = false },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    git = { },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    picker = {},
  },

  ---@class snacks.picker.files.Config: snacks.picker.proc.Config
  keys = {
    { "<leader>bl",  function() Snacks.git.blame_line() end, desc = "Buffers" },
    { "<leader>fg", function() Snacks.picker.grep() end,    desc = "Grep" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
    {
      "<leader>ff",
      function()
        Snacks.picker.files(
          {
            exclude = { "target", ".git/" },
          }
        )
      end,
      desc = "Find Files"
    },
    { "<leader>fH", function() Snacks.picker.highlights() end,          desc = "Highlights" },
    { "<leader>gr", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "<leader>fr", function() Snacks.picker.lsp_references() end,      nowait = true,               desc = "References" },
    { "<leader>fd", function() Snacks.picker.diagnostics() end,         desc = "Diagnostics" },
    { "<leader>sm", function() Snacks.picker.marks() end,               desc = "Marks" },
    { "<leader>fb" , function () Snacks.picker.buffers() end,           desc = "Buffer"},
    { "<leader>fL" , function () Snacks.picker.git_log() end,           desc = "Git Log"},
    { "<leader>fD" , function () Snacks.picker.git_diff() end,          desc = "Git Diff"},
  }
}
