M = {}
vim.g.mapleader = " " --jMake sure to set `mapleader` before lazy so your mappings are correct
function M.quattro()
  local runner = require("quarto.runner")
  vim.keymap.set("n", "<leader>rc", runner.run_cell, { desc = "run cell", silent = true })
  vim.keymap.set("n", "<leader>ra", runner.run_above, { desc = "run cell and above", silent = true })
  vim.keymap.set("n", "<leader>rA", runner.run_all, { desc = "run all cells", silent = true })
  vim.keymap.set("n", "<leader>rl", runner.run_line, { desc = "run line", silent = true })
  vim.keymap.set("v", "<leader>r", runner.run_range, { desc = "run visual range", silent = true })
  vim.keymap.set("n", "<leader>RA", function()
    runner.run_all(true)
  end, { desc = "run all cells of all languages", silent = true })
end

function M.molten()
  -- Provide a command to create a blank new Python notebook
  -- note: the metadata is needed for Jupytext to understand how to parse the notebook.
  -- if you use another language than Python, you should change it in the template.
  default_notebook = [[
  {
    "cells": [
     {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        ""
      ]
     }
    ],
    "metadata": {
     "kernelspec": {
      "display_name": "Python 3",
      "language": "python",
      "name": "python3"
     },
     "language_info": {
      "codemirror_mode": {
        "name": "ipython"
      },
      "file_extension": ".py",
      "mimetype": "text/x-python",
      "name": "python",
      "nbconvert_exporter": "python",
      "pygments_lexer": "ipython3"
     }
    },
    "nbformat": 4,
    "nbformat_minor": 5
  }
]]

  function new_notebook(filename)
    local path = filename .. ".ipynb"
    local file = io.open(path, "w")
    if file then
      file:write(default_notebook)
      file:close()
      vim.cmd("edit " .. path)
    else
      print("Error: Could not open new notebook file for writing.")
    end
  end

  vim.api.nvim_create_user_command('NewNotebook', function(opts)
    new_notebook(opts.args)
  end, {
    nargs = 1,
    complete = 'file'
  })


  vim.keymap.set("n", "<leader>meo", ":MoltenEvaluateOperator<CR>", { desc = "evaluate operator", silent = true })
  vim.keymap.set("n", "<leader>os", ":noautocmd MoltenEnterOutput<CR>",
    { desc = "open output window", silent = true })
  vim.keymap.set('n', "<leader>min", ":MoltenInit /home/extra/.local/share/jupyter/runtime/")
  local function keys(str)
    return function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(str, true, false, true), "m", true)
    end
  end

  local hydra = require("hydra")
  hydra({
    name = "QuartoNavigator",
    hint = [[
      _j_/_k_: move down/up  _r_: run cell
      _l_: run line  _R_: run above
      ^^     _<esc>_/_q_: exit ]],
    config = {
      color = "pink",
      invoke_on_body = true,
    },
    mode = { "n" },
    body = "<leader>j", -- this is the key that triggers the hydra
    heads = {
      { "j",     keys("]b") },
      { "k",     keys("[b") },
      { "r",     ":QuartoSend<CR>" },
      { "l",     ":QuartoSendLine<CR>" },
      { "R",     ":QuartoSendAbove<CR>" },
      { "<esc>", nil,                   { exit = true } },
      { "q",     nil,                   { exit = true } },
    },
  })
end

function M.boneRemaps()
  --[[
  vim.keymap.set({ "n", "v" }, 'r', "<UP>", { noremap = true })
  vim.keymap.set({ "n", "v" }, 'n', "<DOWN>", { noremap = true })
  vim.keymap.set({ "n", "v" }, 's', "<RIGHT>", { noremap = true })
  vim.keymap.set({ "n", "v" }, 'b', "<LEFT>", { noremap = true })
  vim.keymap.set({ "n", "v" }, 'z', "r")

  vim.keymap.set("n", '', "")
  vim.keymap.set("n", '', "")
  vim.keymap.set("n", '', "")
  vim.keymap.set("n", '', "")
  vim.keymap.set("n", '', "")
  vim.keymap.set("n", '', "")
  vim.keymap.set("n", '', "")
  --]]
end

function M.dap()
  vim.keymap.set('n', '<leader>bn', function() require('dap').continue() end)
  vim.keymap.set('n', '<leader>bs', function() require('dap').step_over() end)
  vim.keymap.set('n', '<leader>bi', function() require('dap').step_into() end)
  vim.keymap.set('n', '<leader>bo', function() require('dap').step_out() end)
  vim.keymap.set('n', '<Leader>bt', function() require('dap').toggle_breakpoint() end)
  vim.keymap.set('n', '<Leader>Bs', function() require('dap').set_breakpoint() end)
end

function M.telescope()
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  vim.keymap.set('n', '<leader>fy', builtin.lsp_references, {})
end

function M.oil()
  vim.keymap.set("n", "<leader>n", "<CMD>Oil<CR>", { desc = "Open parent directory" })
end

function M.markdown()
  vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
  vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
end

function M.harpoon()
  local harpoon = require("harpoon");
  local function toggle_telescope(harpoon_files)
    harpoon.ui:toggle_quick_menu(harpoon:list(), { bg = "##FF0000" })
  end

  vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end)
  vim.keymap.set("n", "<leader>z", function() toggle_telescope(require("harpoon"):list()) end)
  --vim.keymap.set("n", "<leader>h", function() toggle_telescope(harpoon:list()) end)

  vim.keymap.set("n", "<C-n>", function() require("harpoon"):list():select(1) end)
  vim.keymap.set("n", "<C-t>", function() require("harpoon"):list():select(2) end)
  vim.keymap.set("n", "<C-m>", function() require("harpoon"):list():select(3) end)
  vim.keymap.set("n", "<C-p>", function() require("harpoon"):list():select(4) end)

  -- Toggle previous & next buffers stored within Harpoon list
  vim.keymap.set("n", "<C-S-P>", function() require("harpoon"):list():prev() end)
  vim.keymap.set("n", "<C-S-N>", function() require("harpoon"):list():next() end)
end

function M.generalLSP()
  vim.api.nvim_set_keymap('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', {})
  vim.keymap.set({ "v", "n" }, "<leader>oi", require("actions-preview").code_actions)
  vim.keymap.set("n", "<leader>vn", "<Cmd>:lua vim.lsp.buf.format()<CR>")
end

function M.lspConfig()
  -- import cmp-nvim-lsp plugin
  local cmp_nvim_lsp = require("cmp_nvim_lsp")

  local keymap = vim.keymap -- for conciseness

  local opts = { noremap = true, silent = true }

  opts.desc = "Show LSP references"
  keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

  opts.desc = "Go to declaration"
  keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

  opts.desc = "Show LSP definitions"
  keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

  opts.desc = "Show LSP implementations"
  keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

  opts.desc = "Show LSP type definitions"
  keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

  opts.desc = "See available code actions"
  keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

  opts.desc = "Smart rename"
  keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

  opts.desc = "Show buffer diagnostics"
  keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

  opts.desc = "Show line diagnostics"
  keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

  opts.desc = "Go to previous diagnostic"
  keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

  opts.desc = "Go to next diagnostic"
  keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

  opts.desc = "Show documentation for what is under cursor"
  keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

  opts.desc = "Restart LSP"
  keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
end

function M.oilKeymaps()
  return {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    --["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
    --["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
    --["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
    --["<C-p>"] = "actions.preview",
    --["<C-c>"] = "actions.close",
    --["<C-l>"] = "actions.refresh",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["`"] = "actions.cd",
    ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
    ["gs"] = "actions.change_sort",
    ["gx"] = "actions.open_external",
    ["g."] = "actions.toggle_hidden",
    ["g\\"] = "actions.toggle_trash",
  }
end

function M.windows()
  vim.keymap.set("n", "<C-j>", "<C-W>j", { silent = true, noremap = true });
  vim.keymap.set("n", "<C-l>", "<C-W>l", { silent = true, noremap = true });
  vim.keymap.set("n", "<C-h>", "<C-W>h", { silent = true, noremap = true });
  vim.keymap.set("n", "<C-k>", "<C-W>k", { silent = true, noremap = true });
end

function M.flash()
  return {
    { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    --   { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  }
end

function M.lazyGit()
  return { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } }
end

return M
