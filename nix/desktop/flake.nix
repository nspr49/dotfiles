{
  description = "A very basic flake";

  inputs = {
    zjstatus = { url = "github:dj95/zjstatus"; };

    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-24.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    ghostty.url = "github:ghostty-org/ghostty";
    wgsl-analyzer.url = "github:wgsl-analyzer/wgsl-analyzer";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, zjstatus, ghostty
    , wgsl-analyzer, nixpkgs-unstable, astal, ... }:
    let
      lib = nixpkgs.lib;

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config = {
          allowUnfree = true;
          allowUnsupportedSystem = true;
        };
        overlays = [
          (final: prev: {
            unstable = import inputs.nixpkgs-unstable {
              inherit (final.stdenv.hostPlatform) system;
              inherit (final) config;
            };
            zjstatus = inputs.zjstatus.packages."x86_64-linux".default;
            hyprpanel = inputs.hyprpanel.packages."x86_64-linux".default;
            wezterm = inputs.wezterm.packages."x86_64-linux".default;
            ghostty = inputs.ghostty.packages."x86_64-linux".default;
            wgsl-analyzer =
              inputs.wgsl-analyzer.packages."x86_64-linux".default;
            astal = {
              url = "github:aylur/astal";
              inputs.nixpkgs.follows = "nixpkgs";
            };
          })

        ];
      };
      pkgs-unstable = nixpkgs-unstable.legacyPackages."x86_64-linux";

    in {
      #    environment.systemPackages = [ inputs.wezterm.packages.${pkgs.system}.default ];
      pkgs."x86_64-linux".default =
        [ pkgs.zjstatus pkgs.hyprpanel pkgs.wezterm ];

      nixosConfigurations = {
        nixos = lib.nixosSystem {
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {

              home-manager.extraSpecialArgs = {
                inherit inputs pkgs pkgs-unstable;
              };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.extra = import ./home.nix;
            }
          ];
          specialArgs = {
            # Pass unstable packages as a special argument
            unstable = import nixpkgs-unstable {
              system = "x86_64-linux";
              config.allowUnfree = true; # If needed for unfree packages
            };
          };
        };
      };
    };

}
