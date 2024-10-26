{ config, pkgs, lib, ...}:
  let
    startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
      ${pkgs.ags}/bin/ags &
      dbus-update-activation-environment --systemd HYPRLAND_INSTANCE_SIGNATURE 
      ${pkgs.hyprpaper}/bin/hyprpaper &
      ${pkgs.mako}/bin/mako & 
      ${pkgs.python3}/bin/python3 ~/dotfiles/hyprshade_activator.py & 
    ''; in
  {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        exec-once = ''${startupScript}/bin/start'';
        exec = [
          "hyprshade auto"
        #  "swaybg -i ~/Pictures/tokyo-ghoul.jpg"
        ];
        "monitor" = ",preferred,auto,1";


        general = {
          "gaps_in" = "7";
          "gaps_out" = "7";
          "border_size" = "4";
          "col.active_border" = "rgba(cba6f7ee)"; 
          "col.inactive_border" = "rgba(89b4faaa)";
          "resize_on_border" = "false";
          "allow_tearing" = "false";
          "layout" = "dwindle";
        };
        env = [
            "XCURSOR_THEME, Banana"
            "XCURSOR_SIZE,32"
            "HYPRCURSOR_THEME, Banana"
            "HYPRCURSOR_SIZE, 32"
        ];
        decoration = {
          rounding = "10";
          active_opacity = "1";
          inactive_opacity = "1.0";
          drop_shadow = "true";
          shadow_range = "10";
          shadow_render_power = "2";
          shadow_ignore_window = "1";
          "shadow_offset"= "0 0";
          "col.shadow"= "rgba(cba6f7ee)";
          "col.shadow_inactive" = "rgba(89b4faee)";
          blur =  {
            enabled = "true";
            size = "1";
            passes = "3";
            contrast = "1.0";
            new_optimizations = "on";
            vibrancy_darkness = "1";
          };
        };

        animations = {
          "enabled" = "true";
          #"bezier" = "overshot, 0.9, 0.9, 0.3, 1.05"; 
          "bezier" = "cubic, 0.79, 0.01, 0.14, 0.53";

          "animation" = [
            "windows, 1, 7, cubic, popin 20%"
              "windowsOut, 1, 7, cubic, popin 10%"
              "border, 1, 10, default"
              "borderangle, 1, 8, default"
              "workspaces, 1, 6, default, slidevert"
              #"workspaces, 1, 6, default"
          ];
        };

        dwindle = {
          "pseudotile" = "true";
         "preserve_split" = "true";
        };

        misc = {
          "disable_hyprland_logo" = "true";
        };

        "$mod" = "SUPER";
        "$terminal" = "kitty";
        "$fileManager" = "dolphin";
        "$menu" = "rofi -show drun";
        "$w1" = "hyprctl hyprpaper wallpaper 'DP-1, ~/Pictures/animeback.jpg'";
        "$w2" = "hyprctl hyprpaper wallpaper 'DP-1, ~/Pictures/tokyo-ghoul.jpg'";
        "$w3" = "hyprctl hyprpaper wallpaper 'DP-1, ~/Pictures/tokyo-street.jpg'";
        "$w4" = "hyprctl hyprpaper wallpaper 'DP-1, ~/Pictures/city.jpg'";
        "$w5" = "hyprctl hyprpaper wallpaper 'DP-1, ~/Pictures/chillrain.png'";
        "$w6" = "hyprctl hyprpaper wallpaper 'DP-1, ~/Pictures/tokyo_street.jpg'";
        "$w9" = "hyprctl hyprpaper wallpaper 'DP-1, ~/Pictures/kaneki.jpg'";
        "$w0" = "hyprctl hyprpaper wallpaper 'DP-1, ~/Pictures/rem.jpg'";

        bind = [
          "$mod, m, exec, $terminal"
            "$mod, q, killactive,"
            "$mod, z, exit,"
            "$mod, E, exec, $fileManager"
            "$mod, V, togglefloating,"
            "$mod, a, exec, $menu"
            "$mod, P, pseudo," # dwindle
            "$mod, I, togglesplit, # dwindle"
            "$mod,E,fullscreen "
            "SUPER_SHIFT , l, exec, hyprlock -c ~/dotfiles/.config/hypr/hyprlock.conf"

            "$mod, 1, workspace, 1"
 #           "SUPER, 1, exec, $w1"
            "$mod, 2, workspace, 2"
 #          "SUPER, 2, exec, $w2"
            "$mod, 3, workspace, 3"
 #          "SUPER, 3, exec, $w3"
            "$mod, 4, workspace, 4"
 #          "SUPER, 4, exec, $w4"
            "$mod, 5, workspace, 5"
 #           "SUPER, 5, exec, $w5"
            "$mod, 6, workspace, 6"
            "$mod, 7, workspace, 7"
            "$mod, 8, workspace, 8"
            "$mod, 9, workspace, 9"
 #           "SUPER, 9, exec, $w9"
            "$mod, 0, workspace, 10"
 #           "SUPER, 0, exec, $w0"

            "$mod SHIFT, 1, movetoworkspace, 1"
            "$mod SHIFT, 2, movetoworkspace, 2"
            "$mod SHIFT, 3, movetoworkspace, 3"
            "$mod SHIFT, 4, movetoworkspace, 4"
            "$mod SHIFT, 5, movetoworkspace, 5"
            "$mod SHIFT, 6, movetoworkspace, 6"
            "$mod SHIFT, 7, movetoworkspace, 7"
            "$mod SHIFT, 8, movetoworkspace, 8"
            "$mod SHIFT, 9, movetoworkspace, 9"
            "$mod SHIFT, 0, movetoworkspace, 10"

            "$mod, h, movefocus, l"
            "$mod, l, movefocus, r"
            "$mod, k, movefocus, u"
            "$mod, j, movefocus, d"

            "$mod, t, togglespecialworkspace, magic"
            "$mod SHIFT, S, movetoworkspace, special:magic"

            "$mod, mouse_down, workspace, e+1"
            "$mod, mouse_up, workspace, e-1"

            ",Print, exec, hyprshot -m region --clipboard-only"
            ",$mod Print, exec, hyprshot -m window --clipboard-only"
            ];

        bindm = [
          "$mod, mouse:272, movewindow"
            "$mod, mouse:273, resizewindow"
        ];


        input = { 
          "kb_layout" = "de";
                "kb_variant" = "bone";
          "follow_mouse" = "1";
          "sensitivity" = "0";
          touchpad = {
            "natural_scroll" = "false";
          };
        };
        layerrule = [
          "blur, launcher"

        ];
        windowrulev2 = [
          "suppressevent maximize, class:.*"
        ];
      }; 
    };
  }
