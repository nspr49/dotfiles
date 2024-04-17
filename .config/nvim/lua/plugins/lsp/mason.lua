return{
  "williamboman/mason.nvim",
  dependencies = {
	 "williamboman/mason-lspconfig.nvim",
"neovim/nvim-lspconfig",
  },
  config = function()
  require("mason").setup()
  require('java').setup()
  require('lspconfig').jdtls.setup({})
  require("mason-lspconfig").setup(
		{
		  ensure_installed = {"lua_ls", "clangd","java_language_server", "angularls", "tsserver","jdtls"  },
		  automatic_installation = true,
		}

	 )
  end,
}
