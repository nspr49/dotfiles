return{
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
      "html",
      "cssls",
      "lua_ls",
      "clangd",
      "angularls", 
      "tsserver",
      "jdtls",
      "cssls",
      "ansiblels"
    },
    automatic_installation = false,
  },
  dependencies = {
    "williamboman/mason.nvim",
  },
}

