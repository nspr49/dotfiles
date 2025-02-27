set -gx EDITOR nvim 
starship init fish | source

#fish_config theme save "Catppuccin Mocha"

fish_vi_key_bindings
alias l "ls -l"
alias cwd "cd /mnt/c/Users/nspringer/Documents"
alias uni "cd ~/documents/uni/"
alias nswitch "sudo nixos-rebuild switch --flake ~/dotfiles/nix/desktop/";
alias ntest "sudo nixos-rebuild test --flake ~/dotfiles/nix/desktop/";
alias rrust "cd ~/documents/rust"

set -gx EDITOR nvim
set fish_greeting

direnv hook fish | source


