{pkgs, config, ...}:

{
  imports = [
    ./config.nix
    ./hardware.nix
    ./graphics.nix
    ./binds
  ];
}
