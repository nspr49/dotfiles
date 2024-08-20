{ config, pkgs, ... }:
{

  imports = [
    ./modules/zsh.nix
    ./modules/hypr.nix
    ../home-manager/home.nix
  ];
  
  home.packages = with pkgs; [
  ];

}
