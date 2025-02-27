$env.config.buffer_editor = "nvim"

#------------------------- VI -------------------------
$env.config.edit_mode = 'vi'

#------------------------- Alias -------------------------
alias nswitch = sudo nixos-rebuild switch --flake ~/dotfiles/nix/desktop/
alias ntest = sudo nixos-rebuild test --flake ~/dotfiles/nix/desktop/

$env.config.show_banner = false




source mocha.nu


$env.TRANSIENT_PROMPT_COMMAND_RIGHT = null
$env.TRANSIENT_PROMPT_MULTILINE_INDICATOR = null


