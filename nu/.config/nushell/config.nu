$env.config.buffer_editor = "nvim"

#------------------------- VI -------------------------
$env.config.edit_mode = 'vi'

#------------------------- Alias -------------------------
alias nswitch = sudo nixos-rebuild switch --flake ~/dotfiles/nix/desktop/
alias ntest = sudo nixos-rebuild test --flake ~/dotfiles/nix/desktop/





$env.PROMPT_COMMAND_RIGHT = ""
source mocha.nu
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
