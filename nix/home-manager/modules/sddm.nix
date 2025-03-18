{ pkgs, ... }:
let

in {
  services.displayManager.sddm = {
    enable = true;
    package = pkgs.unstable.kdePackages.sddm; # qt6 sddm version

    theme = "sddm-astronaut-theme";
    extraPackages = [ pkgs.sddm-astronaut ];

    wayland.enable = true;
  };

}
