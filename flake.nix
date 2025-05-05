{
  description = "Home Manager configuration of dvill";

  inputs = {
    nixGL.url = "github:nix-community/nixGL";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    helix = {
      url = "github:helix-editor/helix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, helix, nixGL, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          nixGL.overlay
          (final: prev: {
            helix = helix.packages.${system}.default;
          }) 
        ];
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
