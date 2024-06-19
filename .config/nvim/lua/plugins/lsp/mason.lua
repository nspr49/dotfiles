return{
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    --"neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup(
    {
      ensure_installed = {"html","cssls", "lua_ls", "clangd","angularls", "tsserver","jdtls", "cssls"--[[ "java_language_server"  --]]},
      automatic_installation = false,
    })
    require('mason-tool-installer').setup({
      ensure_installed={
        'java-debug-adapter',
        'java-test',
        'eslint_d',
        'eslint',
        "prettier",
        }
    })
    local lspconfig = require('lspconfig')
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lsp_attach = function(client,bufnr)
    end
    

    require("mason-lspconfig").setup_handlers({
      function (server_name)
        --dont call setup for jdtls
        if server_name ~= 'jdtls' then
          lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
          })
          end
        end
          }) 
        end
        } 
        
