{
  description = "A very basic flake";

  inputs = {
    zjstatus = { url = "github:dj95/zjstatus"; };
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, nixpkgs-unstable, nixpkgs, home-manager, zjstatus, ... }:
    let
      lib = nixpkgs.lib;

      pkgs = import nixpkgs {
        system = "x86_64-linux";
        overlays = [
          (final: prev: {
            zjstatus = inputs.zjstatus.packages."x86_64-linux".default;
            hyprpanel = inputs.hyprpanel.packages."x86_64-linux".default;
            unstable = inputs.nixpkgs-unstable.packages."x86_64-linux".default;
          })
        ];
        config = {
          allowUnfree = true;
          allowUnsupportedSystems = true;
        };
      };

    in {
      #    environment.systemPackages = [ inputs.wezterm.packages.${pkgs.system}.default ];
      pkgs."x86_64-linux".default = [ pkgs.zjstatus pkgs.hyprpanel ];
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {

              home-manager.extraSpecialArgs = { inherit inputs pkgs; };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.extra = import ./home.nix;
            }
          ];
        };
      };
    };

}
