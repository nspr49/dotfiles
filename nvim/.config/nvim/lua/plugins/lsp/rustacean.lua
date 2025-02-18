return {
  'mrcjkb/rustaceanvim',
  version = '^5', -- Recommended
  lazy = false,   -- This plugin is already lazy
  ft = "rust",
  config = function()
    local extension_path = vim.fn.expand('~/.vscode/extensions/vadimcn.vscode-lldb/lldb/lib/liblldb.so')
    local codelldb_path = vim.fn.expand('~/.vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb')

    vim.g.rustaceanvim = {
      -- Plugin configuration
      dap = {
        adapter = require('rustaceanvim.config').get_codelldb_adapter(codelldb_path, extension_path), }
    }
  end
}
