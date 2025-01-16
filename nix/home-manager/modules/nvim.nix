# home.nix or wherever you configure neovim
{ pkgs, pkgs-unstable, ... }:

{
  # ... other config
  programs.neovim = let
    toLua = str: ''
      lua << EOF
      ${str}
      EOF
    '';
    toLuaFile = file: ''
      lua << EOF
      ${builtins.readFile file}
      EOF
      $'';
  in {
    enable = true;
    #   package = pkgs.unstable.neovim-unwrapped;
    plugins = with pkgs.vimPlugins; [
      { plugin = rustaceanvim; }
      {
        plugin = nvim-treesitter.withAllGrammars;
        #config = toLuaFile ./nvim/plugin/treesitter.lua;
      }
      { plugin = otter-nvim; }
      { plugin = neorg; }
    ];
    withNodeJs = true;
    withRuby = true;
    withPython3 = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = with pkgs; [
      nixfmt-classic
      basedpyright
      ruff
      java-language-server
      imagemagick # for image rendering
      pyright
      vscode-extensions.vadimcn.vscode-lldb
      rust-analyzer
      tailwindcss-language-server
      vscode-langservers-extracted
      angular-language-server
      lua-language-server
      jdt-language-server
      nodePackages.typescript-language-server
      ltex-ls
      languagetool
      rustfmt
      nil
      luajitPackages.luarocks
    ];
    extraPython3Packages = ps:
      with ps; [
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
      vadimcn.vscode-lldb
      vscodevim.vim
      ms-toolsai.jupyter
      ms-python.python
      ms-toolsai.jupyter-renderers
      yzhang.markdown-all-in-one
    ];
  };
}

