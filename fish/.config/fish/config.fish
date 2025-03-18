set -gx EDITOR nvim 
starship init fish | source

#fish_config theme save "own"

fish_vi_key_bindings
alias l "ls -l"
alias cwd "cd /mnt/c/Users/nspringer/Documents"
alias uni "source ~/dotfiles/fishscripts/unifolders.fish"
alias nswitch "sudo nixos-rebuild switch --flake ~/dotfiles/nix/desktop/";
alias ntest "sudo nixos-rebuild test --flake ~/dotfiles/nix/desktop/";
alias rrust "cd ~/documents/rust"
alias screen "nu ~/dotfiles/screenshot.nu"

set fish_greeting


direnv hook fish | source


set -Ux FZF_DEFAULT_OPTS "\
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--color=border:#313244,label:#cdd6f4"
