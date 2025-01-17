{
  description = "Home Manager configuration of dvill";

  inputs = {
    nixGL.url = "github:nix-community/nixGL";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixGL, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nixGL.overlay ];
      };
    in {
      homeConfigurations."dvill" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [ ./home.nix ];
        extraSpecialArgs = {
          inherit nixGL;
        };
      };
    };
}
