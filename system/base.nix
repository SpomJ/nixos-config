{ config, pkgs, inputs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  nix = {
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };
    settings = {
      auto-optimise-store = true;
      trusted-users = ["@wheel"];
      substituters = [
        "https://nix-community.cachix.org"
        "https://hyprland.cachix.org"
        "https://cache.nixos.org"
      ];
      trusted-substituters = [
        "https://nix-community.cachix.org"
        "https://hyprland.cachix.org"
        "https://cache.nixos.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      ];
      experimental-features = ["nix-command" "flakes"];
    };
  };

  #system.autoUpgrade = {
  #  enable = true;
  #  flake = inputs.self.outPath;
  #  flags = [
  #    "--recreate-lock-file"
  #    "-L"
  #  ];
  #  dates = "daily";
  #};

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs;[];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  security.rtkit.enable = true;

  services.dbus.implementation = "broker";

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "C.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "C.UTF-8";
    LC_IDENTIFICATION = "C.UTF-8";
    LC_MEASUREMENT = "C.UTF-8";
    LC_MONETARY = "C.UTF-8";
    LC_NAME = "C.UTF-8";
    LC_NUMERIC = "C.UTF-8";
    LC_PAPER = "C.UTF-8";
    LC_TELEPHONE = "C.UTF-8";
    LC_TIME = "C.UTF-8";
  };

  system.stateVersion = "25.05";
}
