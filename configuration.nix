# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ];

boot.loader.systemd-boot.enable = true;
boot.loader.efi.canTouchEfiVariables = true;

 hardware.opengl = {
    enable = true;
    #driSupport = true;
    #driSupport32Bit = true;
 };
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
    enable=true;
    layout = "de";
    xkbVariant = "";
    videoDrivers = ["nvidia"];
    displayManager.gdm = {
      enable = true;
      wayland=true;
    };
  };

    hardware.nvidia = {
    modesetting.enable = true;

    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
  };
  
# Configure console keymap
  console.keyMap = "de";

#enable zsh
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
#starship
  programs.starship = {
    enable = true;
  };

#enable pulseaudio
  #hardware.pulseaudio.enable=true;


#nix.settings.experimental-features = ["nix-command" "flakes"];
# Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.extra = {
    isNormalUser = true;
    description = "extra";
    extraGroups = [ "networkmanager" "wheel" "audio" ];
    packages = with pkgs; [];
  };

# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.hyprland.enable=true;

# List packages installed in system profile. To search, run:
# $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
      wget
      pkgs.libappindicator-gtk3
      pkgs.wlroots
      grim
      pkgs.dconf
      pkgs.gtk3
      kitty
      pkgs.polkit
      xwayland
      slurp
      wl-clipboard
      mako
      git
      pkgs.alacritty
      stow
      home-manager
      
#wm
      pkgs.hyprland
#pkgs.hyprpaper # fuck this
# sway bg
      pkgs.swaybg
#menu 
      pkgs.pipewire
#network
      pkgs.networkmanager
#pkgs.wg-netmanager
      pkgs.networkmanagerapplet
      pkgs.cacert
#zsh
      pkgs.zsh
killall
      #c
      ];

  fonts.packages = with pkgs; [
    nerdfonts

  ];
security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;

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
# services.openssh.enable = true;

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
