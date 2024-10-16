return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    --    local status, ts = pcall(require, "nvim-treesitter.configs")
    --   if (not status) then return end
    require("nvim-treesitter.configs").setup({
      --      ensure_installed = {  "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "java", "css", "angular", "python","typescript","json", "svelte", "javascript" },
      --sync_install = false,
      auto_install = false,
      highlight = { enable = true, vim_additional_regex_highlighting = true },
      --    disable = { "lua" },
      indent = { enable = false },
      autotag = {
        enable = true,
      }
    })
  end

}
