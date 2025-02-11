{ config, pkgs, lib, ... }: {

  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -lah";
      update = "nix flake update && home-manager switch";
      nswitch = "sudo nixos-rebuild switch --flake ~/dotfiles/nix/desktop/";
      ntest = "sudo nixos-rebuild test --flake ~/dotfiles/nix/desktop/";
      uni = "cd ~/documents/uni";
      rrust = "cd ~/documents/rust";
    };
    interactiveShellInit = ''
      # Custom initialization
       fish_vi_key_bindings
            starship init fish | source
            set -gx EDITOR nvim
            set -gx JAVA_HOME ${pkgs.zulu23}/lib/openjdk
            set fish_greeting
    '';
  };

}
