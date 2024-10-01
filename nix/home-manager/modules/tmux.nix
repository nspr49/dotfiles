{ config, pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    plugins = with pkgs;
    [
    {  
      plugin = tmuxPlugins.catppuccin;
      extraConfig = "
        set -g @catppuccin-flavour 'mocha'
        set -g @catppuccin_window_left_separator ''
        set -g @catppuccin_window_right_separator ''
        set -g @catppuccin_window_middle_separator ' '


        set -g @catppuccin_window_current_color \"#{thm_pink}\"
        set -g @catppuccin_window_current_number \"#{thm_pink}\"
        set -g @catppuccin_window_current_fill \"all\"

        set -g @catppuccin_window_default_color \"#{thm_black}\"
        set -g @catppuccin_window_default_background \"#{thm_magenta}\"
        set -g @catppuccin_window_default_fill \"all\"

        set -g @catppuccin_status_modules_right \"...\";
        set -g @catppuccin_status_background \"default\"
        ";
    }
    {
      plugin = tmuxPlugins.resurrect;
    }
    {
      plugin = tmuxPlugins.sensible;
    }
    {
      plugin = tmuxPlugins.continuum;
    }
    {
      plugin=tmuxPlugins.vim-tmux-navigator;
    }
    ];
    extraConfig = "
    set-option -g status-position top
      set -g default-terminal 'screen-256color'
      set -as terminal-features ',xterm-256color:RGB'
      set -g prefix C-b

    ";
  };


}
