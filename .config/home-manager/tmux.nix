{ config, pkgs, ...}:
{
  programs.tmux = {
    enable = true;
    plugins = with pkgs;
    [
    {  
      plugin = tmuxPlugins.catppuccin;
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
    ];
    extraConfig = "
      set -g default-terminal 'screen-256color'
    set -as terminal-features ',xterm-256color:RGB'
    set -g prefix C-s
    ";
  };


}
