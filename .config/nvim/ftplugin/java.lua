local config = {
    cmd = {'jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    settings = {
      java = {
        format = {
          settings = {
            url = '/home/extra/dotfiles/eclipse_style.xml',
          }
        }
      }
    },
}
--[[
augroup_id = vim.api.nvim_create_augroup(
"FormatModificationsDocumentFormattingGroup",
{ clear = false }
)
vim.api.nvim_clear_autocmds({ group = augroup_id, buffer = vim.api.nvim_get_current_buf() })

vim.api.nvim_create_autocmd(
{ "BufWritePre" },
{
  group = augroup_id,
  buffer = vim.api.nvim_get_current_buf(),
  callback = function()
    local lsp_format_modifications = require"lsp-format-modifications"
    lsp_format_modifications.format_modifications(vim.lsp.get_clients({ name = "jdtls", bufnr = buf })[1], vim.api.nvim_get_current_buf())
  end,
}
)
]]--
vim.keymap.set('v', '<Leader>1f', vim.lsp.buf.format, bufopts)
require('jdtls').start_or_attach(config)
