return{
  "stevearc/conform.nvim",
  dependencies = {"lewis6991/gitsigns.nvim"},
  config = function ()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "prettier" },
        -- Conform will run multiple formatters sequentially
        python = { "prettier" },
        -- Use a sub-list to run only the first available formatter
        javascript = {  "prettier" },
        java = { "google-java-format" },
        html = {"prettier"},
        css = {"prettier" },
        typescript = {"prettier"},
        javascriptangular = {"prettier"},
        json = {"prettier"},
      },
      format_on_save = function()
        local hunks = require("gitsigns").get_hunks()
        if hunks == nil then 
          return;
          end
        local format = require("conform").format
        for i = #hunks, 1, -1 do
          local hunk = hunks[i]
          if hunk ~= nil and hunk.type ~= "delete" then
            local start = hunk.added.start
            local last = start + hunk.added.count
            -- nvim_buf_get_lines uses zero-based indexing -> subtract from last
            local last_hunk_line = vim.api.nvim_buf_get_lines(0, last - 2, last - 1, true)[1]
            local range = { start = { start, 0 }, ["end"] = { last - 1, last_hunk_line:len() } }
            format({ range = range })
          end
        end
      end
    })
    local conform = require("conform")
    vim.keymap.set("n", "<leader>vv", function ()
      conform.format({
        lsp_fallback=true,
        async = true,
        timeout_ms = 500
      })
    end
    )
  end
}
