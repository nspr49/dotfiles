return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "williamboman/mason.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "williamboman/mason-lspconfig.nvim",   opt = { automatic_installation = false, } }
  },
  config = function()
    package.path = package.path .. ";../?.lua"
    require("mason").setup()
    require("mason-lspconfig").setup()

    local lspconfig = require("lspconfig")
    require("plugins.keymaps.all").lspConfig()




    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr
      vim.diagnostic.config({
        severity_sort = true,
      })

      -- set keybinds
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["yamlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    -- configure c server
    lspconfig["clangd"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    -- configure typescript server with plugin
    lspconfig["biome"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig["nil_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig["gopls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig['ltex'].setup({
      on_attach = on_attach,
      cmd = { "ltex-ls" },
      filetypes = { "markdown", "text" },
      flags = { debounce_text_changes = 300 },
      settings = {
        ltex = {
          language = "de-DE"
        }
      }
    })

    --[[lspconfig.rust_analyzer.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    --]]
    -- configure lua server (with special settings)
    lspconfig["lua_ls"].setup({
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          }
        }
      }
    })
  end,
}
