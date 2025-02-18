return{
  "williamboman/mason-lspconfig.nvim",
  opts = {
    ensure_installed = {
--[[      "html",
      "cssls",
      "lua_ls",
      "clangd",
      "angularls", 
      "tsserver",
      "jdtls",
      "cssls",
      "ansiblels",
      "nil_ls" --]]
    },
    automatic_installation = false,
  },
  dependencies = {
    "williamboman/mason.nvim",
  },
}

