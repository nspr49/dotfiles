return {
  "stevearc/conform.nvim",
  dependencies = { "lewis6991/gitsigns.nvim" },
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        -- Conform will run multiple formatters sequentially
        python = { "prettier" },
        -- Use a sub-list to run only the first available formatter
        javascript = { "prettier" },
        java = { "clang-format" },
        html = { "prettier" },
        css = { "prettier" },
        typescript = { "ts-standard" },
        javascriptangular = { "prettier" },
        json = { "prettier" },
      },
      format_on_save = function()
        local hunks = require("gitsigns").get_hunks()
        if hunks == nil then
          return;
          end
        local format = require("conform").format
        if format == nil then
          return;
        end
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
    vim.keymap.set("n", "<leader>vv", function()
      local hunks = require("gitsigns").get_hunks()
      if hunks == nil then
        return;
      end
      local format = require("conform").format
      if format == nil then
        return;
      end
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
    )
    vim.keymap.set("n", "<leader>gv", function()
      require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end
    )
  end
}
