
{ config, pkgs, lib, ...}:
{


programs.fish = {
  #enable = true;
  shellAliases = {
    ll = "ls -lah";
    update = "nix flake update && home-manager switch";
  };
  interactiveShellInit = ''
    # Custom initialization
    starship init fish | source
    set -gx EDITOR nvim
    set -gx JAVA_HOME ${pkgs.zulu23}/lib/openjdk
    '';
};

}
