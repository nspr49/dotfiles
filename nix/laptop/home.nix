{ config, pkgs, pkgs-unstable, ... }:

{
  imports = [ # ./modules/hypr.nix
    #    ./modules/zsh.nix
    ../home-manager/home.nix
  ];
}
