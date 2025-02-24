return {
  'MagicDuck/grug-far.nvim',
  config = function()
    require('grug-far').setup({
      -- options, see Configuration section below
      -- there are no required options atm
      engine = 'astgrep' -- is default, but 'astgrep' can be specified
    });

    vim.keymap.set("n", "<leader>gf", function() require('grug-far').open(opts) end, { silent = true });
    vim.keymap.set({"v","n"}, "<leader>gv", function() require('grug-far').with_visual_selection() end, { silent = true });

    vim.keymap.set({"v","n"}, "<leader>gcf", function() require('grug-far').open({ prefills = { paths = vim.fn.expand("%") } }) end, { silent = true });

    vim.keymap.set({"v","n"}, "<leader>gcv", function() require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand("%") } }) end, { silent = true });
  end
}
