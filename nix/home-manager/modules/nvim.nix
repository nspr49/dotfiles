  # home.nix or wherever you configure neovim
  { pkgs, ... }:

    # the vimPlugins.molten-nvim package has not been merged into nixpkgs yet but for now you can use this
     {
    # ... other config
    programs.neovim = {
      # whatever other neovim configuration you have
      enable=true;
      plugins = with pkgs.vimPlugins; [
        # ... other plugins
       # pkgs.vimPlugins.markdown-preview-nvim
      nvim-treesitter.withAllGrammars
      quarto-nvim
      jupytext-nvim
      ];
      withNodeJs = true;
    withRuby = true;
    withPython3 = true;
    extraLuaPackages = ps: [ ps.magick ];
      extraPackages = with pkgs; [
        # ... other packages
        imagemagick # for image rendering
        pyright
      ];
      
      extraPython3Packages = ps: with ps; [
        # ... other python packages
        pynvim
        jupyter-client
        cairosvg # for image rendering
        pnglatex # for image rendering
        plotly # for image rendering
        pyperclip
        pylatexenc
        pylatex
      ipython
      nbformat
      ];
    vimAlias = true;
    
    
   };
  }
