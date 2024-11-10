{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
#    wezterm.url = "github:wez/wezterm?dir=nix";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }: 
    let
      lib = nixpkgs.lib;
  system = "x86_64-linux";
 # pkgs = nixpkgs.legacyPackages.${system};
      in {
  #    environment.systemPackages = [ inputs.wezterm.packages.${pkgs.system}.default ];
        nixosConfigurations = {
          nixos = lib.nixosSystem {
                        modules = [ 
            ./configuration.nix 
            home-manager.nixosModules.home-manager
            {
              
              home-manager.extraSpecialArgs = {
                inherit inputs;
              };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              
              home-manager.users.extra = import ./home.nix;
            }
            ];
          };
        };
      };

}
