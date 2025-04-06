{ config, pkgs, inputs, pkgs-unstable, ... }:

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
    #    ./modules/hypr.nix
    ./modules/tmux.nix
    #./modules/zsh.nix
    ./modules/fastfetch/fastfetch.nix
    ./modules/zellij.nix
    ./modules/nvim.nix
    ./modules/fish.nix
  ];
  home.packages = with pkgs; [
    inputs.astal.packages.${system}.default
    jetbrains.webstorm
    llvmPackages_latest.libllvm
    sass
    llvmPackages_latest.libcxx
    wallust
    platformio
    gcc
    ghostscript
    markdownlint-cli2
    osu-lazer
    #pkgs.pkgsCross.avr.buildPackages.gcc
    #pkgs.pkgsCross.avr.buildPackages.avrlibc
    #avrlibc
    btop
    nodejs_22
    nushell
    chafa
    ast-grep
    dooit
    openconnect_openssl
    swww
    starship
    gdb
    bear
    ghostty
    at
    gnumake
    texliveFull
    pandoc
    (python312.withPackages (ps:
      with ps; [
        networkx
        ipykernel
        numpy
        #             pyzmq
        jupyter
      ]))
    ollama

    zulu23
    accountsservice
    rofi-wayland
    swaybg
    tmux
    fastfetch
    spotify
    hyprshot
    hyprpaper
    rio
    firefox
    hyprpicker
    qemu
    hyprcursor
    ags
    wezterm
    socat
    xwayland
    jq
    zed-editor
    hyprpanel
    postman
    wlogout
    unzip
    mako
    discord
    pwvucontrol
    anki-bin
    ripgrep
    cava
    hyprlock
    drawing
    #bitwarden
    hyprshade
    bibata-cursors
    obsidian
    docker
    podman
    gitlab-runner
    chromium
    yazi
    pywal

    #form
    google-java-format
    #languages

    lua
    widevine-cdm
    catppuccin-cursors
    bun
    lazygit
    fzf
    pnglatex
    mpvpaper
    vscode
    netpbm
    texliveFull
    # latexrun
    optipng
    banana-cursor
    pkgs-unstable.zellij
    zjstatus
    zip
    fish
    #unstable.neovim
    lm_sensors
  ];

  nixpkgs.overlays = [
    (final: prev: {
      ags = prev.ags.overrideAttrs
        (old: { buildInputs = old.buildInputs ++ [ pkgs.libdbusmenu-gtk3 ]; });
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
  home.sessionVariables = { EDITOR = "vim"; };

  home.pointerCursor = {
    package = pkgs.banana-cursor;
    gtk = { enable = true; };
    x11 = {
      enable = true;
      defaultCursor = "Bibata-Modern-Ice";
    };
    name = "Bibata-Modern-Ice";
    size = 24;
  };
  programs.wezterm.enable = true;
}

