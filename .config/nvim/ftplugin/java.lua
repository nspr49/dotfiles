local config = {
    cmd = {'jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    settings = {
      java = {
        format = {
          settings = {
            url = '/home/extra/dotfiles/ec2.xml',
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


vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function ()
    local hunks = require("gitsigns").get_hunks()
    if hunks == nil then
      return;
    end
    local format = vim.lsp.buf.format
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

--vim.keymap.set('v', '<Leader>1f', vim.lsp.buf.format, bufopts)
require('jdtls').start_or_attach(config)
