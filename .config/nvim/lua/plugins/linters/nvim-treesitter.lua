return{
		"nvim-treesitter/nvim-treesitter",build = ":TSUpdate",
    config = function ()
    local configs = require("nvim-treesitter.configs")
      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "java", "css", "angular", "python","typescript","json", "svelte", "javascript", "nix" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = false },  
        })
    end

	}
