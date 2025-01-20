return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies ={
    'rafamadriz/friendly-snippets',
    "echasnovski/mini.icons"

  },


  -- use a release tag to download pre-built binaries
  version = '*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {

    appearance = {
      -- Sets the fallback highlight groups to nvim-cmp's highlight groups
      -- Useful for when your theme doesn't support blink.cmp
      -- Will be removed in a future release
     use_nvim_cmp_as_default = false,
      -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono',
      kind_icons = {
        Function = 'λ',
        Text = '',
        Method = '',
        Keyword = '',
        Interface = 'I'
      },
    },
    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.
    keymap = {
      -- set to 'none' to disable the 'default' preset
      preset = 'default',

      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-n>'] = { 'select_next', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' },
      ['<CR>'] = {'accept', 'fallback'},

      -- disable a keymap from the preset

      -- show with a list of providers
      ['<C-space>'] = { function(cmp) cmp.show({ providers = {'lsp', 'snippets' } }) end },

     
      -- optionally, separate cmdline keymaps
      -- cmdline = {}
    },

    --signature = { enabled = true },

    completion = {
      
      menu = {
        border = 'rounded',

        scrollbar = true,

        auto_show = function(ctx)
           return ctx.mode ~= "cmdline" and not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
         end,
          draw = {
            components = {

            },
            treesitter = {'lsp'},

            
            columns = { { "label", "label_description" }, { "kind_icon" }, { "kind" } },
          },
         
      },

      trigger = {
        show_on_trigger_character = true,
      },

       documentation = {
                auto_show = true,
                auto_show_delay_ms = 250,
                treesitter_highlighting = true,
                window = {
                  border = "rounded",
                 winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,EndOfBuffer:BlinkCmpMenuBorder',
                },
       },
      list = {
           selection = {
              preselect = false,
              auto_insert = true,
           }
          },

        
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        lsp = {
          score_offset = 1000,

        },

        snippets = {
          score_offset = 0,
        },

        path = {
          score_offset=500;
        },

      },
    },
  },


  opts_extend = { "sources.default" }
}
