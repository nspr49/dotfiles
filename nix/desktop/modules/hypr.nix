{ pkgs, config, ... }: {

  wayland.windowManager.hyprland = {
    settings = {
      "$mod" = "SUPER";
      bind = [
        "SUPER ,u, exec, hyprctl keyword monitor 'DVI-D-1, disable'"
        "SUPER_SHIFT ,U, exec, hyprctl keyword monitor 'DVI-D-1, disable'"
      ];
      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "GLX_VENDOR_LIBRARY_NAME,nvidia"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"

      ];
      # "monitor" = [
      #wtf nvidia????
      #  "Unknown-1, disable"
      #  ];

    };

  };
}
