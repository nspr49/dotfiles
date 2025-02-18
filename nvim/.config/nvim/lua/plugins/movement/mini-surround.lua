return {
  'echasnovski/mini.nvim',
  version = '*',
  config = function()
    require('mini.surround').setup({
     mappings = {
    add = 'xa', -- Add surrounding in Normal and Visual modes
    delete = 'xd', -- Delete surrounding
    find = 'xf', -- Find surrounding (to the right)
    find_left = 'xF', -- Find surrounding (to the left)
    highlight = 'xh', -- Highlight surrounding
    replace = 'xr', -- Replace surrounding
    update_n_lines = 'xn', -- Update `n_lines`

    suffix_last = 'l', -- Suffix to search with "prev" method

    suffix_next = 'n'-- Suffix to search with "next" method
  },
    })
  end
}
