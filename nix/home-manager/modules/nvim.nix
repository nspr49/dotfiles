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
      {
        plugin = rustaceanvim;
      }
      #{
      #plugin = nvim-treesitter.withAllGrammars;
      #config = toLuaFile ./nvim/plugin/treesitter.lua;
      #}
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (p: [

        p.c
        p.java
        p.rust
        p.python
        p.nix
        p.markdown
        p.lua
        p.typescript
        p.bash
        p.cmake
        p.css
        p.dockerfile
        p.glsl
        p.html
        p.javascript
        p.json5
        p.json
        p.latex
        p.markdown_inline
        p.nginx
        p.scss
        p.sql
        p.toml
        p.tsx
        p.verilog
        #        p.wgsl
        #p.nu
      ]))
      { plugin = otter-nvim; }
      { plugin = markdown-preview-nvim; }
      {
        plugin = nvim-treesitter-parsers.wgsl;
      }
      #      { plugin = blink-cmp; }
    ];
    withNodeJs = true;
    withRuby = true;
    withPython3 = true;
    extraLuaPackages = ps: [ ps.magick ];
    extraPackages = with pkgs; [
      nixfmt-classic
      basedpyright
      clang-tools
      ruff
      java-language-server
      imagemagick # for image rendering
      pyright
      vscode-extensions.vadimcn.vscode-lldb
      markdown-oxide
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
      unstable.wgsl-analyzer
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

