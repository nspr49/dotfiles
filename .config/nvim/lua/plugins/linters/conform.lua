return{
  "stevearc/conform.nvim",
  config = function ()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "prettier" },
        -- Conform will run multiple formatters sequentially
        python = { "prettier" },
        -- Use a sub-list to run only the first available formatter
        javascript = {  "prettier" },
        java = { "prettier" },        html = {"prettier"},
        css = {"prettier" },
        typescript = {"prettier"},
        javascriptangular = {"prettier"},
        json = {"prettier"},
      },
    })
    local conform = require("conform")
    vim.keymap.set("n", "<leader>v", function ()
      conform.format({
        lsp_fallback=true,
        async = false,
        timeout_ms = 500
      })
    end
    )
  end
}
