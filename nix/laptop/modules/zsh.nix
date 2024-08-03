{pkgs, config, ...}:
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      switch = "sudo nixos-rebuild switch --flake ~/dotfiles/nix/laptop";
      ntest = "sudo nixos-rebuild test --flake ~/dotfiles/nix/laptop/";
    };
  };
}
