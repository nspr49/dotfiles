return {
  -- see the image.nvim readme for more information about configuring this plugin
  "3rd/image.nvim",
  opts = {
    backend = "kitty", -- whatever backend you would like to use
    max_width = 200,
    max_height = 45,
    max_height_window_percentage = math.huge,
    max_width_window_percentage = math.huge,
    window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  },
}
