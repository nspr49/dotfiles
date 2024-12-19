vim.keymap.set("n", "<leader>dd", ":lua vim.cmd.RustLsp('debuggables')<CR>");
vim.keymap.set("n", "<leader>db", ":lua vim.cmd.RustLsp('debug')<CR>");
vim.keymap.set("n", "<leader>dr", ":lua vim.cmd.RustLsp('debuggables', bang=true)<CR>");
require('plugins.keymaps.all').dap()
