{pkgs, ...}: 
#treesitterWithGrammars = (pkgs.vimPlugins.nvim-treesitter.withAllGrammars);
  #treesitter-parsers = pkgs.symlinkJoin {
  #  name = "treesitter-parsers";
  #  paths = treesitterWithGrammars.dependencies;
  #};


  {


   programs.neovim = {
    enable = true;
    package = pkgs.neovim;
    vimAlias = true;

    plugins = [
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
    ];
   
  };
   #home.file."./.local/share/nvim/lazy/nvim-treesitter/" = {
   #   recursive = true;
   # source = pkgs.vimPlugins.nvim-treesitter.withAllGrammars;
  ##};
}
