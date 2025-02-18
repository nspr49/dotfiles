return {
  "nvimtools/hydra.nvim",
  config = function()
    -- create hydras in here
    --
    local function keys(str)
      return function()
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(str, true, false, true), "m", true)
      end
    end
    --
    require("hydra").setup();
    local hydra = require("hydra")
    hydra({
      name = "LSP_SIGNS",
      hint = " _u_/_d_: up/down\n" ..
      " _<esc>_/_q_: quit",
      config = {
        color = "pink",
        invoke_on_body = true,
        hint = {
          float_opts = {
           border =  "rounded" ,
          },
        },
      },
      mode = { "n" },
      body = "<leader>hl", -- this is the key that triggers the hydra
      heads = {
        { "d",     keys("]d") },
        { "u",     keys("[d") },
        { "<esc>", nil,                   { exit = true } },
        { "q",     nil,                   { exit = true } },
      },
    })
    --[[
    --
    --
     vim.keymap.set('n', '<leader>bn', function() require('dap').continue() end)
  vim.keymap.set('n', '<leader>bs', function() require('dap').step_over() end)
  vim.keymap.set('n', '<leader>bi', function() require('dap').step_into() end)
  vim.keymap.set('n', '<leader>bo', function() require('dap').step_out() end)
  vim.keymap.set('n', '<Leader>bt', function() require('dap').toggle_breakpoint() end)
  vim.keymap.set('n', '<Leader>Bs', function() require('dap').set_breakpoint() end)
    --]]

    hydra({
      name = "DEBUGGER",
      config = {
        color = "pink",
        invoke_on_body = true,
        hint = {
          window = true,
        float_opts = {
          border=  "rounded" ,
        },
        },
        
      },

    hint = " _n_/_s_: next/step\n" ..
    " _i_/_o_: step in/out\n" ..
    " _<esc>_/_q_: quit",


      mode = { "n" },
      body = "<leader>hd", -- this is the key that triggers the hydra
      heads = {
        {"n",
        function() require('dap').continue() end},
        {"s",function() require('dap').step_over() end},
        {"i", function() require('dap').step_into() end},
        {"o",  function() require('dap').step_out() end},
        { "<esc>", nil,                   { exit = true } },
        { "q",     nil,                   { exit = true } },
      },
    })
    
  end
}
