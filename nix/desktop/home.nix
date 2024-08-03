{ config, pkgs, ... }:
{

  imports = [
    ./modules/zsh.nix
    ../home-manager/home.nix
  ];
}
