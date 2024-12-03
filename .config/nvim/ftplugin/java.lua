local config = {
  --cmd = { vim.fn.expand('~/.local/share/nvim/mason/bin/jdtls') },
  cmd = { vim.fn.expand('jdtls') },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  settings = {
    java = {
      format = {
        settings = {
          url = '/home/nspringer/dotfiles/ec2.xml',
        }
      }
    }
  },

}

-- This bundles definition is the same as in the previous section (java-debug installation)
local bundles = {
  vim.fn.glob("/home/extra/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar"),
};

-- This is the new part
--vim.list_extend(bundles, vim.split(vim.fn.glob("/path/to/microsoft/vscode-java-test/server/*.jar", 1), "\n"))
config['init_options'] = {
  bundles = bundles,
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
--
--]]
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function()
    local hunks = require("gitsigns").get_hunks()
    if hunks == nil then
      return;
    end
    local format = vim.lsp.buf.format
    local flag = true;

    for _, client in pairs(vim.lsp.get_clients()
    ) do
      if
          client
          and (client.name ~= nil or client.name == "jdtls") then
        flag = false;
      end
    end

    if not vim.lsp.buf_is_attached(0, vim.lsp.client.id) then
      return;
    end

    if format == nil or flag then
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

--[[vim.keymap.set('n', '<Leader>1f',
  function()
    local hunks = require("gitsigns").get_hunks()
    if hunks == nil then
      return;
    end
    local format = vim.lsp.buf.format
    local flag = true;

    for _, client in pairs(vim.lsp.get_clients()
    ) do
      if
          client
          and (client.name ~= nil or client.name == "jdtls") then
        flag = false;
      end
    end

    if not vim.lsp.buf_is_attached(0, vim.lsp.client.id) then
      return;
    end


    if format == nil or flag then
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
-]]

local dap = require('dap')

vim.keymap.set('n', '<leader>bn', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>bs', function() require('dap').step_over() end)
vim.keymap.set('n', '<leader>bi', function() require('dap').step_into() end)
vim.keymap.set('n', '<leader>bo', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>bt', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>Bs', function() require('dap').set_breakpoint() end)

-- Function to attach to the Java process
function attach_to_debug()
  dap.configurations.java = {
    {
      type = 'java',
      request = 'attach',
      name = 'Debug (Attach) - Remote',
      hostName = '127.0.0.1',
      port = 5005,
    }
  }
  -- Attach debugger
  dap.run(dap.configurations.java[1])
end

function attach_to_wildfly()
  dap.configurations.java = {
    {
      type = 'java',
      request = 'attach',
      name = 'Debug (Attach) - Remote',
      hostName = '127.0.0.1',
      port = 8787,
    }
  }
  -- Attach debugger
  dap.run(dap.configurations.java[1])
end

vim.keymap.set('n', '<leader>cg', ':lua attach_to_debug()<CR>')
vim.keymap.set('n', '<leader>cw', ':lua attach_to_wildfly()<CR>')

local jdtls = require("jdtls")
-- Needed for debugging
config["on_attach"] = function(client, bufnr)
  jdtls.setup_dap({ hotcodereplace = "auto" })
  require("jdtls.dap").setup_dap_main_class_configs()
end


vim.keymap.set("n", "<leader>od", ":lua attach_to_debug()<CR>");
require('jdtls').start_or_attach(config)
