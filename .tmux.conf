set -g default-terminal "screen-256color"
set -as terminal-features ",xterm-256color:RGB"

set-environment -g TMUX_PLUGIN_MANAGER_PATH '~/.tmux/plugins/'

set -g prefix C-s

set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-resurrect'
set -g @plugin 'tmux-plugins/tmux-continuum'
set -g @plugin 'catppuccin/tmux'
set -g @catppuccin_status_background "default"
set -g @catppuccin_status_connect_separator "yes"

# status modules list
set -g @catppuccin_status_modules_right "application session date_time"
set -g @catppuccin_status_left_separator "█"
set -g @catppuccin_status_right_separator "█"
set -g @catppuccin_status_middle_separator "█"
set -g @catppuccin_status_right_separator_inverse "no"
set -g @catppuccin_window_status_enable "yes"
set -g @catppuccin_window_status_icon_enable "yes"
set -g @catppuccin_status_background "default"

set -g @catppuccin_status_fill "icon"

run '~/.tmux/plugins/tpm/tpm'
