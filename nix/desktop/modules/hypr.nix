{ pkgs, config, ... }:
{

  wayland.windowManager.hyprland = {
    settings =  {
      "$mod" = "SUPER";
      bind = [
        "SUPER ,u, exec, hyprctl keyword monitor 'DVI-D-1, disable'"
          "SUPER_SHIFT ,U, exec, hyprctl keyword monitor 'DVI-D-1, disable'"
      ];
     # "monitor" = [
#wtf nvidia????
      #  "Unknown-1, disable"
    #  ];

    };

  };
}
