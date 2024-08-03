{ pkgs, config, ... }:
{

  wayland.windowManager.hyprland = {
    "$mod" = "SUPER";
    settings =  {


    };
    "monitor" = [
#wtf nvidia????
      "Unknown-1, disable"
    ];
    bind = [
      "$mod ,u, exec, hyprctl keyword monitor 'DVI-D-1, disable'"
    ];
  };

}
