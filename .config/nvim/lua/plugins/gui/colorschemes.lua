return {
  	{ "Mofiqul/dracula.nvim" },
  	{'markvincze/panda-vim'},
	{"sainnhe/everforest"},
  {"folke/tokyonight.nvim"},
  {"eldritch-theme/eldritch.nvim"},
	{"catppuccin/nvim"},
  {"Rigellute/shades-of-purple.vim"}, 
  {"rebelot/kanagawa.nvim"},
  {"loctvl842/monokai-pro.nvim"},  		
  {"wilmanbarrios/palenight.nvim"},
  {"scottmckendry/cyberdream.nvim"},
  {"rose-pine/nvim"},
  {"0xstepit/flow.nvim"},
dependencies = {
  "nvim-treesitter"
},

  config = function ()
   require("catppuccin").setup({
     flavour="mocha",
     color_overrides = {
     }
   })
  end

  }
