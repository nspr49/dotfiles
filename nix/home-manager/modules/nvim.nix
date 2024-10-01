  # home.nix or wherever you configure neovim
  { pkgs, ... }:

    # the vimPlugins.molten-nvim package has not been merged into nixpkgs yet but for now you can use this
     {
    # ... other config
    programs.neovim = {
      # whatever other neovim configuration you have
      plugins = with pkgs.vimPlugins; [
        # ... other plugins
        pkgs.vimPlugins.markdown-preview-nvim
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      ];
      withNodeJs = true;
    withRuby = true;
    withPython3 = true;
      extraPackages = with pkgs; [
        # ... other packages
        imagemagick # for image rendering
      ];
      extraLuaPackages = ps: [
        # ... other lua packages
      ];
      extraPython3Packages = ps: with ps; [
        # ... other python packages
        pynvim
        jupyter-client
        cairosvg # for image rendering
        pnglatex # for image rendering
        plotly # for image rendering
        pyperclip
      ];
    };
  }
