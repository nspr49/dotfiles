return {
  "GCBallesteros/jupytext.nvim",
  -- Depending on your nvim distro or config you may need to make the loading not lazy
  -- lazy=false,
  config = function()
    require("jupytext").setup({
      force_ft = "quarto",
      style = "quarto",
      output_extension = "qmd",
      custom_language_formatting = {
        python = {
          extension = "qmd",
          style = "quarto",
          force_ft = "quarto", -- you can set whatever filetype you want here
        },
      },
    })
  end
}
