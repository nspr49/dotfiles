return {
  	{ "Mofiqul/dracula.nvim" },
  	{'markvincze/panda-vim'},
	{"sainnhe/everforest"},
  {"folke/tokyonight.nvim"},
	{"catppuccin/nvim",
  

},
  {"Rigellute/shades-of-purple.vim"}, 
  {"rebelot/kanagawa.nvim"},
  {"loctvl842/monokai-pro.nvim"},  		
  config = function ()
   require("catppuccin").setup({
     flavour="mocha",
     color_overrides = {
     }
   })
  end
  }
