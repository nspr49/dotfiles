{ config, pkgs, ... }:

{
# Home Manager needs a bit of information about you and the paths it should
# manage.
  home.username = "extra";
  home.homeDirectory = "/home/extra";
# This value determines the Home Manager release that your configuration is
# compatible with. This helps avoid breakage when a new Home Manager release
# introduces backwards incompatible changes.
#
# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

# The home.packages option allows you to install Nix packages into your
# environment.
    imports = [
    ./modules/hypr.nix
    ./modules/tmux.nix
    ./modules/zsh.nix
    ];

  home.packages = with pkgs; [
    starship
      gcc
      gdb
      gnumake
      pyenv
      python3
      python312Packages.cmake
      gtksourceview
      gtk3
      webkitgtk
      accountsservice
      rofi-wayland
      swaybg
      waybar
      nodejs_22
      firefox
      tmux
      fastfetch
      spotify
      hyprshot
      hyprpicker
      hyprcursor
      ags

socat
jq

      wlogout
      unzip
      mako
      discord
      pwvucontrol
      discord-ptb
      discord-canary
      zed-editor
      anki
      ripgrep
      cava
      hyprlock
      eww
      drawing
      ags
      go-sct
      bitwarden
#fuck db
      chromium

#tmux
      tmuxPlugins.sensible
      tmuxPlugins.resurrect
      tmuxPlugins.continuum

#form
      google-java-format

      #languages
      zulu8

#lspjkj
      libclang
      lua
      lua-language-server
      jdt-language-server
      nodePackages.typescript-language-server
      vscode-langservers-extracted
  #    tree-sitter-grammars.tree-sitter-java
      nil
      ];
  nixpkgs.overlays = [
    (final: prev:
    {
      ags = prev.ags.overrideAttrs (old: {
        buildInputs = old.buildInputs ++ [ pkgs.libdbusmenu-gtk3 ];
      });
    })
  ];
  home.file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;

# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
  };

# Home Manager can also manage your environment variables through
# 'home.sessionVariables'. These will be explicitly sourced when using a
# shell provided by Home Manager. If you don't want to manage your shell
# through Home Manager then you have to manually source 'hm-session-vars.sh'
# located at either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/extra/etc/profile.d/hm-session-vars.sh
#
  home.sessionVariables = {
# EDITOR = "emacs";
  };

 programs.neovim = {
       enable = true;
       viAlias = true;
       withPython3 = true;
       plugins = with pkgs.vimPlugins; [
         nvim-treesitter.withAllGrammars
       ];
  };

# Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
