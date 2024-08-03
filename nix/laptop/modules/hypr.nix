{pkgs, config, ...}:
{

  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, u, exec, hyprctl keyword monitor 'eDP-1, disable'"
      ];
    };
  };
}
