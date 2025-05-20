{
  description = "NixOS";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    catppuccin.url = "github:catppuccin/nix";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{nixpkgs, home-manager, catppuccin, nix-index-database, ...}: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./system/default.nix
        ./user/default.nix
        nix-index-database.nixosModules.nix-index
        { programs.nix-index-database.comma.enable = true; }
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "bak";
          home-manager.users.nix = {
            imports = [
              ./user/home.nix
              catppuccin.homeModules.catppuccin
            ];
          };
        }
      ];
    };
  };
}
