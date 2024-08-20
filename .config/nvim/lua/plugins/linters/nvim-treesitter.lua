return {
  "nvim-treesitter/nvim-treesitter",
  config = function ()
    require'nvim-treesitter.configs'.setup({
      ensure_installed = {  "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "java", "css", "angular", "python","typescript","json", "svelte", "javascript" }, 
      --sync_install = false,
      auto_install = false,
      highlight = { enable = true, additional_vim_regex_highlighting=false; },
      indent = { enable = false },
    })
  end 

}
