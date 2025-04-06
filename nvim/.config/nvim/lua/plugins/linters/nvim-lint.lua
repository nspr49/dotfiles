return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint");
    lint.linters_by_ft = {
      javascript = { "ESLint" },
      typescript = { "ESLint" },
      python = { "ruff" },
      typescriptangular = { "ESLint" },
      go = { "golangci-lint" },
      markdown = { "markdownlint-cli2" },

    }

    require('lint').linters["markdownlint-cli2"].args = { "/github/dotfiles-latest/.markdownlint.yaml" }

    --[[
    local lint_augroup = vim.api.create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end
    })
    ]] --
  end
}
