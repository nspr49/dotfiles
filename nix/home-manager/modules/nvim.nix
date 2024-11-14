# home.nix or wherever you configure neovim
{ pkgs, ... }:

{
# ... other config
  programs.neovim =
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n$";
  in{
    enable=true;
    plugins = with pkgs.vimPlugins; [
    {
      plugin = nvim-treesitter.withAllGrammars;
      #config = toLuaFile ./nvim/plugin/treesitter.lua;
    }
    {
      plugin = otter-nvim;
    }
    ];
    withNodeJs = true;
    withRuby = true;
    withPython3 = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = with pkgs; [
      imagemagick # for image rendering
        pyright
        rust-analyzer
        tailwindcss-language-server 
        lua-language-server
        jdt-language-server
        nodePackages.typescript-language-server
        ltex-ls
        languagetool
        rustfmt
        nil
        luajitPackages.luarocks
    ];
    extraPython3Packages = ps: with ps; [
      pynvim
        jupyter-client
        jupytext
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

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
        ms-toolsai.jupyter
        ms-python.python
        ms-toolsai.jupyter-renderers
        yzhang.markdown-all-in-one
    ];
  };
}

