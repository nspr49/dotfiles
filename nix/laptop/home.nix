{ config, pkgs, ... }:

{
  imports = [
    ./modules/hypr.nix
    ./modules/zsh.nix
    ../home-manager/home.nix
  ];
}
