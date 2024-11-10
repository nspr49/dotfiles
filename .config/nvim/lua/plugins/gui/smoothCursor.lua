return {
  'gen740/SmoothCursor.nvim',
  config = function()
    vim.cmd("highlight smoothcur guifg=#cba6f7 guibg=NONE gui=bold")
    require('smoothcursor').setup({
      type = "fancy",
      texthl = "smoothcur",

      fancy = {
        enable = true, -- enable fancy mode
        head = { cursor = "󰝥", texthl = "smoothcur", linehl = nil }, -- false to disable fancy head
        body = {
          { cursor = "󰝥", texthl = "smoothcur" },
          { cursor = "󰝥", texthl = "smoothcur" },
          { cursor = "●", texthl = "smoothcur" },
          { cursor = "●", texthl = "smoothcur" },
          { cursor = "•", texthl = "smoothcur" },
          { cursor = ".", texthl = "smoothcur" },
          { cursor = ".", texthl = "smoothcur" },
        },
        tail = { cursor = nil, texthl = "SmoothCursor" } -- false to disable fancy tail
      },
    })
  end
}
