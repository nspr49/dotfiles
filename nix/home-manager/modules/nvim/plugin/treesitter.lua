require("nvim-treesitter.configs").setup({
  highlight = { enable = true, vim_additional_regex_highlighting = true },
  disable = { "julia", "lua" },
  indent = { enable = false },
  autotag = {
    enable = true,
  }
})
