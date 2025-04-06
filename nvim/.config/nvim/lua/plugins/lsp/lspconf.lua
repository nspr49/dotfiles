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
      --client.server_capabilities.semanticTokensProvider = nil
      opts.buffer = bufnr
      vim.diagnostic.config({
        severity_sort = true,
      })
      -- disable semantic highlighting
      -- more stuff here...

      -- set keybinds
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = require('blink.cmp').get_lsp_capabilities();

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
      root_dir = function(fname)
        return require("lspconfig.util").root_pattern(
          "Makefile",
          "configure.ac",
          "configure.in",
          "config.h.in",
          "meson.build",
          "meson_options.txt",
          "build.ninja"
        )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
          fname
        ) or require("lspconfig.util").find_git_ancestor(fname)
      end,
      cmd = {
        "clangd",
        -- "--background-index",
        --  "--clang-tidy",
        -- "--header-insertion=iwyu",
        --   "--completion-style=detailed",
        --"--function-arg-placeholders",
        -- "--fallback-style=llvm",
      },
      capabilities = capabilities,
      on_attach = on_attach,
    })
    --[[
    lspconfig["ccls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
    --]]
    -- configure typescript server with plugin
    lspconfig["biome"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig.r_language_server.setup {}


    lspconfig["angularls"].setup({
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

    lspconfig["markdown_oxide"].setup {
      capabilities = capabilities,
      on_attach = on_attach
    }
    lspconfig["wgsl_analyzer"].setup {
      capabilities = capabilities,
      on_attach = on_attach
    }

    lspconfig["pyright"].setup {
      settings = {
        pyright = {
          -- Using Ruff's import organizer
          disableOrganizeImports = true,
        },
        python = {
          analysis = {
            -- Ignore all files for analysis to exclusively use Ruff for linting
            ignore = { '*' },
          },
        },
      },
    }
    lspconfig["ruff"].setup({
      on_attach = on_attach,
      trace = 'messages',
      init_options = {
        settings = {
          logLevel = 'debug',
        }
      }
    })

    lspconfig['ltex'].setup({
      on_attach = on_attach,
      cmd = { "ltex-ls" },
      filetypes = { "markdown", "text", "tex" },
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
