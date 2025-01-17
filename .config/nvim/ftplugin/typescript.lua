

local dap = require('dap')

require('plugins.keymaps.all').dap()

-- Function to attach to the Java process
function start_chrome()
  dap.run(dap.configurations.angular)
end
function start_node()
  dap.run(dap.configurations.node)
end


dap.configurations.typescriptng = { -- change this to javascript if needed
    
        type = "pwa-chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
}

function attach_ng()
  dap.run(dap.configurations.typescriptng)
  
end

vim.keymap.set('n', '<leader>cw', ':lua attach_ng()<CR>')
vim.keymap.set('n', '<leader>cg', ':lua start_node()<CR>')
