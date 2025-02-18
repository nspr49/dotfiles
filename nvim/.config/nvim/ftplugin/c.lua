local dap = require('dap')


-- works after 11.0
--[[
dap.adapters.codelldb = {
  type = "executable",
  command = vim.fn.expand("~/.vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb"), -- or if not in $PATH: "/absolute/path/to/codelldb"

  -- On windows you may have to uncomment this:
  -- detached = false,
}
--]]

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    command = vim.fn.expand("~/.vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb"), -- or if not in $PATH: "/absolute/path/to/codelldb"
    args = { "--port", "${port}" },

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.c = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

vim.keymap.set("n", "<leader>dd", ":DapContinue<CR>");
