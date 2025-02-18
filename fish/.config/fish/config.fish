set -gx EDITOR nvim 
starship init fish | source

#fish_config theme save "Catppuccin Mocha"

fish_vi_key_bindings
alias l "ls -l"
alias cwd "cd /mnt/c/Users/nspringer/Documents"

set fish_greeting

direnv hook fish | source


