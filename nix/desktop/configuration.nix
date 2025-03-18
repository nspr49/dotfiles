# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, unstable, ... }: {

  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../shared-modules/virtualisation.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.graphics = {
    enable = true;
    #   enableDri = true;
    enable32Bit = true;
  };
  hardware.keyboard.qmk.enable = true;
  # Bootloader.
  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "/dev/nvme0n1";
  # boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  #networking.wireless.iwd.enable = true;
  networking.networkmanager.enable = true;
  #networking.networkmanager.wifi.backend = "iwd";
  #networking.wireless.enable = true; 
  # Set your time zone.
  time.timeZone = "Europe/Berlin";
  # trying to to fuck up windows on dual boot

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb.layout = "de";
    xkb.variant = "bone";
    videoDrivers = [ "nvidia" ];
    #displayManager.gdm = {
    #     enable = true;
    #     wayland = true;
    #   };
  };
  services.displayManager.ly.enable = true;

  #  services.displayManager.sddm = {
  #    enable = true;
  #    package = pkgs.kdePackages.sddm;
  #    wayland = { enable = true; };
  #    extraPackages = with pkgs; [ kdePackages.qtmultimedia ];
  #    theme = "sddm-astronaut-theme";
  #  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };

  # Configure console keymap
  console.keyMap = "bone";

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;
  users.users.extra.shell = pkgs.fish;
  #starship
  programs.starship = { enable = true; };

  #enable pulseaudio
  #hardware.pulseaudio.enable=true;

  #nix.settings.experimental-features = ["nix-command" "flakes"];
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.extra = {
    isNormalUser = true;
    description = "extra";
    extraGroups = [ "networkmanager" "wheel" "audio" "docker" ];
    packages = with pkgs; [ ];
  };

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;

  };

  programs.hyprland = { enable = true; };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    nvidia-container-toolkit
    vulkan-tools
    nvidia-docker
    bibata-cursors
    wget
    xdg-desktop-portal
    steamcmd
    at
    pkgs.libappindicator-gtk3
    pkgs.wlroots
    (unstable.sddm-astronaut.override { embeddedTheme = "pixel_sakura"; })
    grim
    prismlauncher
    pkgs.dconf
    pkgs.gtk3
    kitty
    pkgs.polkit
    slurp
    wl-clipboard
    git
    pkgs.alacritty
    stow
    home-manager
    pkgs.vesktop
    direnv

    (pkgs.hyprland.override { withSystemd = true; })
    pkgs.swaybg
    pkgs.pipewire
    pkgs.networkmanager
    pkgs.networkmanagerapplet
    pkgs.cacert
    pkgs.fish
    killall
    protonup

    gtk4-layer-shell
    gtk4
    dbus
    dbus-glib
    libpkgconf
  ];

  fonts.packages = with pkgs; [
    nerdfonts
    font-awesome

  ];
  security.rtkit.enable = true;
  services.udev.packages = with pkgs; [ platformio-core.udev ];
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };

  programs.dconf.enable = true;
  environment.sessionVariables.MOZ_ENABLE_WAYLAND = "0";
  environment.sessionVariables.STEAM_EXTPRA_COMPAT_TOOLS_PATHS =
    "/home/extra/.steam/root/compatibilitytools.d";
  services.atd.enable = true;
  # run cuda in docker
  hardware.nvidia-container-toolkit.enable = true;
  hardware.pulseaudio.support32Bit = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall =
      true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  # run dynamically linked binaries
  programs.nix-ld.enable = true;

  programs.firefox = {
    enable = true;
    preferences = {
      "widget.use-xdg-desktop-portal.file-picker" = 1;
      "widget.use-xdg-desktop-portal.mime-handler" = 1;
    };

  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  #services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
