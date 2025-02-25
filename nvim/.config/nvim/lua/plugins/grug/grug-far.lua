return {
  'MagicDuck/grug-far.nvim',
  config = function()
    require('grug-far').setup({
      -- options, see Configuration section below
      -- there are no required options atm
      engine = 'astgrep', -- is default, but 'astgrep' can be specified
      engines = {
        astgrep = {
          -- ast-grep executable to use, can be a different path if you need to configure
          path = 'ast-grep',
        }
      }
    });


    vim.keymap.set("n", "<leader>gf", function() require('grug-far').open({}) end,
      { silent = true, desc = "Replace in Path" });
    vim.keymap.set({ "v"}, "<leader>gf", function() require('grug-far').with_visual_selection() end,
      { silent = true, desc = "Replace visual in path" });

    vim.keymap.set({ "n" }, "<leader>gc",
      function() require('grug-far').open({ prefills = { paths = vim.fn.expand("%") } }) end,
      { silent = true, desc = "Replace in current file" });

    vim.keymap.set({ "v" }, "<leader>gc",
      function() require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand("%") } }) end,
      { silent = true, desc = "Replace visual in current file" });
  end
}
