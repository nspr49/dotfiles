return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  coonfig = function()
    local lint = require("lint");
    lint.linters_by_ft = {
      javascript = { "ESLint" },
      typescript = { "ESLint" },
      typescriptangular = { "ESLint" },
      go = {"golangci-lint"}
    }

    local lint_augroup = vim.api.create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end
    })
  end
}
