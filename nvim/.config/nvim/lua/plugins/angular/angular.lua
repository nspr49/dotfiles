return {
  'joeveiga/ng.nvim',

  opts = {},
  ft = { "typescript", "html", "css" },
  config = function()
    local opts = { noremap = true, silent = true }
    local ng = require("ng");
    vim.keymap.set("n", "<leader>kt", ng.goto_template_for_component, opts)
    vim.keymap.set("n", "<leader>kc", ng.goto_component_with_template_file, opts)
    vim.keymap.set("n", "<leader>kT", ng.get_template_tcb, opts)
  end

}
