return {
  "jbyuki/nabla.nvim",
  opts = {},
  config = function()
    vim.keymap.set("n", '<leader>p', ':lua require("nabla").popup()<CR>')
  end
}
