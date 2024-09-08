set -g default-terminal "screen-256color"
set -as terminal-features ",xterm-256color:RGB"
set-option -g status-position top

set-environment -g TMUX_PLUGIN_MANAGER_PATH '~/.tmux/plugins/'

set -g prefix C-s

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'catppuccin/tmux'
set -g @plugin 'set -g @plugin 'aserowy/tmux.nvim'
set -g @catppuccin_status_background "default"
set -g @catppuccin_status_connect_separator "yes"


set -g @catppuccin-flavour 'mocha'
set -g @catppuccin_window_left_separator ''
set -g @catppuccin_window_right_separator ''
set -g @catppuccin_window_middle_separator ' '


set -g @catppuccin_window_current_color "#{thm_pink}"
set -g @catppuccin_window_current_number "#{thm_pink}"
set -g @catppuccin_window_current_fill "all"

set -g @catppuccin_window_default_color "#{thm_black}"
set -g @catppuccin_window_default_background "#{thm_magenta}"
set -g @catppuccin_window_default_fill "all"

set -g @catppuccin_status_modules_right "...";
run '~/.tmux/plugins/tpm/tpm'
