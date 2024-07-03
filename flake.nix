#
#  NixOS System Flake Configuration
#
#  flake.nix *
#   ├─ common.nix
#   ├─ ./hosts
#   │   └─ ...
#   └─ ./users
#       └─ ...
#
{
  description = "My NixOS System Flake Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05"; # Nix Packages (Default)
    nixos-hardware.url = "github:nixos/nixos-hardware/master"; # Hardware Specific Configurations

    home-manager.url = "github:nix-community/home-manager/release-24.05"; # User Environment Manager
  };

  outputs =
    inputs:
    let

      system = "x86_64-linux";

      specialArgs = inputs { inherit system; };

      shared-modules = [
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager = {
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
          };
        }
      ];

    in
    let
      hosts = [ "thinknix460" ];

      mkSystem = host: {
        name = host;
        value = inputs.nixpkgs.lib.nixosSystem {
          inherit system specialArgs;
          modules = shared-modules ++ [ (./. + "/hosts/${host}.nix") ];
        };
      };

      configs = builtins.listToAttrs ((builtins.map (h: mkSystem h)) hosts);
    in
    {
      nixosConfigurations = configs;
    };
}
