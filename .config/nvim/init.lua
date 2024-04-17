vim.cmd("set number")
vim.cmd("set modifiable")
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")
vim.cmd("set softtabstop=2")
vim.cmd('autocmd BufRead, BufNewFile *.flex set filetype=c')
vim.cmd("autocmd BufRead, BufNewFile *.c set filetype=java")
vim.cmd("set listchars=tab:»·,trail:·")
vim.cmd("set list")
-- test
--Lazy vim Setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Set Mapleader
vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct
require("lazy").setup({
	{ import = "plugins"}, {import = "plugins.lsp"}
	},{})
--require('java').setup()
--require('lspconfig').jdtls.setup({})
--telescope
--vim.cmd("autocmd VimEnter * NERDTree")
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>b', ':lua require\'dap\'.toggle_breakpoint()<CR>')
--NERDTree
vim.keymap.set('n', '<leader>n', ':NERDTree<CR>')
--nvim dab
--vim.api.nvim_set_keymap("n", "<leader>du", ":DapUiToggle<Cr>", {noremap=true})
--vim.cmd.set("n", "<leader>dp", ":lua require('dapui').open({reset = true})<CR>", {noremap = true})


--require("dapui").setup()



