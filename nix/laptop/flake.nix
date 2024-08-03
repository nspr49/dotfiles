{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: 
    let
      lib = nixpkgs.lib;
      in {
        nixosConfigurations = {
          nixos = lib.nixosSystem {
            system = "x86_64-linux";
            modules = [ 
            ./configuration.nix 
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

             home-manager.users.extra = import ./home.nix;
            }
            ];
          };
        };
      };
}
